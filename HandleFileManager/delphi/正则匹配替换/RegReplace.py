#encoding=utf-8
import os
import re
import shutil
import sys
import traceback

def selinux_config(file,zzbds,findstr,newstr):
    file_selinux = file
    backup_file_selinux = file+'.bak'
    temp_file_selinux = file+'.temp'
    shutil.copy2(file_selinux,backup_file_selinux)
    with open(file_selinux,mode='r') as fr, open(temp_file_selinux,mode='w') as fw:    
        for (idx,line) in enumerate(fr):
            #if line.upper().find('SHOWMESSAGEBOX')>0:
            if line.upper().find(findstr)>0:
                #re_ = '(\+\d+\d+\+)\|'
                re_ = zzbds
                #line=re.sub(re_,r'\1~~',line)
                line=re.sub(re_,newstr,line)
            try: 
                fw.write(line)
            except Exception as e:
                traceback.print_exc()
    os.remove(file_selinux)
    os.rename(temp_file_selinux, file_selinux)

def RegReplace(path,zzbds,findstr,newstr):
    if os.path.isdir(path):
        for root, dirs, files in os.walk(path):
            for name in files:
                print(os.path.join(root, name))
                if name.find('.pas')>0:
                    try:
                        selinux_config(os.path.join(root, name),zzbds,findstr,newstr)
                    except:
                        continue
    if os.path.isfile(path):
        try:
            selinux_config(path,zzbds,findstr,newstr)
        except:
            print(path)
    
if __name__=='__main__':
    RegReplace(sys.argv[1],sys.argv[2],sys.argv[3],sys.argv[4])
    #1.path 2.正则表达式 3.定位字符串 4.替换后