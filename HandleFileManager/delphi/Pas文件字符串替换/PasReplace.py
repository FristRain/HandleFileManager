#encoding=utf-8
import os
import re
import shutil
import sys
import traceback

def selinux_config(fileName,oldStr,newStr):
    file_selinux = fileName
    backup_file_selinux = fileName+'.bak'
    temp_file_selinux = fileName+'.temp'
    shutil.copy2(file_selinux,backup_file_selinux)
    with open(file_selinux,mode='r') as fr, open(temp_file_selinux,mode='w') as fw:    
        for (idx,line) in enumerate(fr):
            #if line.find('存盘成功') > 0 or line.find('存盘失败') > 0:
            line=line.replace(oldStr,newStr)
            try:
                fw.write(line)
            except Exception as e:
                traceback.print_exc()
    os.remove(file_selinux)
    os.rename(temp_file_selinux, file_selinux)

def PasReplace(path,oldStr,newStr):
    for root, dirs, files in os.walk(path):
        for name in files:
            print(os.path.join(root, name))
            if name.find('.pas')>0:
                try:
                    selinux_config(os.path.join(root, name),oldStr,newStr)
                except:
                    continue;
if __name__=='__main__':
    PasReplace(sys.argv[1],sys.argv[2],sys.argv[3])
    #1.路径 2.老字符串 3.新字符串