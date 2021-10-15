#encoding=utf-8
import os
import re
import shutil
import sys
import traceback

NewContol = []
spaceStr =''


def ControlReplace(path,ControlType,NewControlPath):
    global NewContol
    global spaceStr
    with open(NewControlPath,mode='r') as fr:
        for (idx,line) in enumerate(fr):
            if line.find('object')>0:
                spaceStr=line.split('object')[0] + '  '
            line=line.replace(' ','')
            if line.find('end')<0:
                NewContol.append(line)

    if os.path.isdir(path):
        for root, dirs, files in os.walk(path):
            for name in files:
                print(os.path.join(root, name))
                if name.endswith('.dfm')>0:
                    try:
                        #父类窗体控件不处理
                        listExcept=dealDfm(os.path.join(root, name),ControlType,NewContol[0].split(':')[1])
                    except:
                        continue
                if name.endswith('.pas')>0:
                    try:
                        dealPas(os.path.join(root, name),ControlType,NewContol[0].split(':')[1],listExcept)
                    except:
                        continue
    if os.path.isfile(path):
        if path.endswith('.dfm')>0:
            try:
                #父类窗体控件不处理
                listExcept=dealDfm(path,ControlType,NewContol[0].split(':')[1])
            except:
                print(path)
        if path.endswith('.pas')>0:
            try:
                dealPas(path,ControlType,NewContol[0].split(':')[1],listExcept)
            except:
                print(path)

def CheckProperty(Property,List):
    for Item in List:
        if Item==Property:
            return True
    return False

def dealDfm(filename,oldControlType,newControlType):
    file_selinux=filename
    backup_file_selinux = filename+'.bak'
    temp_file_selinux = filename+'.temp'
    newControlType=newControlType.replace('\r','').replace('\n','')
    shutil.copy2(file_selinux,backup_file_selinux)
    appendText=''
    ListExcept=[]
    #控件不处理的属性 有需要自己加
    PropertyList=['Left','Top','Width','Height','Caption','OnClick','Action']
    for Item in NewContol:
        if Item.find('object')>=0:
            #line=line.replace(oldControlType,newControlType)
            continue
        elif CheckProperty(Item.split('=')[0].replace(' ',''),PropertyList):
            continue
        else:
            appendText=appendText + spaceStr + Item
    global ModStat
    global countS
    #写入标记
    global WriteBJ
    ModStat = False
    with open(file_selinux,mode='r') as fr, open(temp_file_selinux,mode='w') as fw:
        for (idx,line) in enumerate(fr):
            WriteBJ = True
            if line.find(oldControlType)>0:
                if line.find('inherited')>0:
                    ListExcept.append((line.split('inherited')[1].replace(' ','')).split(':')[0])
                    WriteBJ=True
                else:
                    line=line.replace(oldControlType,newControlType.replace(' ',''))
                    ModStat = True
                    fw.write(line)
                    continue
            if ModStat:
                if CheckProperty(line.split('=')[0].replace(' ',''),PropertyList):
                    WriteBJ=True
                else:
                    WriteBJ=False
                if line.find('end')>0:
                    line = appendText.replace(spaceStr,line.split('end')[0]+'  ') + line
                    ModStat = False
                    WriteBJ=True
            if WriteBJ:
                fw.write(line)
    os.remove(file_selinux)
    os.rename(temp_file_selinux, file_selinux)
    return ListExcept
                    
def dealPas(filename,oldControlType,newControlType,listExcept):
    file_selinux=filename
    newControlType=newControlType.replace('\r','').replace('\n','')
    backup_file_selinux = filename+'.bak'
    temp_file_selinux = filename+'.temp'
    shutil.copy2(file_selinux,backup_file_selinux)
    with open(file_selinux,mode='r') as fr, open(temp_file_selinux,mode='w') as fw:
        for (idx,line) in enumerate(fr):
            if line.find(oldControlType)>0:
                if not CheckProperty((line.split(':')[0].replace(' ','')),listExcept):
                    line = line.replace(oldControlType,newControlType)
                    fw.write(line)
                    continue
            try:
                fw.write(line)
            except Exception as e:
                traceback.print_exc()
    os.remove(file_selinux)
    os.rename(temp_file_selinux, file_selinux)

if __name__=='__main__':
    ControlReplace(sys.argv[1],sys.argv[2],sys.argv[3])
    #1.路径 2.old控件类型 3.新控件路径(针对dfm文件 例 mlskinButton.txt)