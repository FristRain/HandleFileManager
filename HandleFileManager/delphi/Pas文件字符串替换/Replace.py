import os
import re
import shutil
import sys
import traceback

def selinux_config(sss):
    file_selinux = sss
    backup_file_selinux = sss+'.bak'
    temp_file_selinux = sss+'.temp'
    shutil.copy2(file_selinux,backup_file_selinux)    
    with open(file_selinux,mode='r') as fr, open(temp_file_selinux,mode='w') as fw:    
        for (idx,line) in enumerate(fr):    
            if line.find('存盘成功') > 0 or line.find('存盘失败') > 0:
                line=line.replace('存盘','保存')                
            try:
                fw.write(line)
            except Exception as e:
                traceback.print_exc()
    os.remove(file_selinux)
    os.rename(temp_file_selinux, file_selinux)

def StrReplace(path):
    for root, dirs, files in os.walk(path):
        for name in files:
            print(os.path.join(root, name))
            if name.find('.pas')>0:
                try:
                    selinux_config(os.path.join(root, name))
                except:
                    continue;
if __name__=='__main__':
    StrReplace(sys.argv[1])