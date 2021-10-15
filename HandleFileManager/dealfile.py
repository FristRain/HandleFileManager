# /usr/bin/env python
# coding=utf8
import os
import argparse
import logging
import sys
sys.path.append(r'delphi\正则匹配替换'.decode('utf-8'))
import RegReplace
sys.path.append(r'delphi\Pas文件字符串替换'.decode('utf-8'))
import PasReplace
sys.path.append(r'delphi\控件替换'.decode('utf-8'))
import ControlReplace


FORMAT = '[%(asctime)s, %(levelname)-7s]: %(message)s'
logging.basicConfig(format=FORMAT)
logger = logging.getLogger('spider')
logger.setLevel(logging.INFO)

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--path", required=True, help="need deal file.\n需要处理的文件".decode('utf-8'))
    parser.add_argument("-m", "--moudle", required=True,choices=['KJReplace','PasReplace','RegReplace'], help="choices deal file moudle,[KJReplace]:replace control.[Replace]:replace string.\n 选择处理模式,[KJReplace]:替换控件.\n [PasReplace]:Pas文件字符串替换\n".decode('utf-8'))
    parser.add_argument("-o", "--other", help="list of other arguments,example1 [python dealfile.py path KJReplase both control type,new control file].\nexample2 [python dealfile.py path Replase pas oldstring,newstring].\n".decode('utf-8')
        +"example3 [python dealfile.py path RegReplace pas regex,findstring,newString]\n".decode('utf-8')
        +"一个参数数组，示例1[python dealfile.py path KJReplase both 控件类型,控件文件(新控件文件)]\n 示例2[python dealfile.py path Replase pas 需要替换的字符串,替换成为的字符串]\n".decode('utf-8')
        +"实例3 python dealfile.py path RegReplace pas 正则表达式,定位字符串,新的字符串".decode('utf-8'))
    args = parser.parse_args()
    return args

if __name__=="__main__":
    args = parse_args()
    logger.info("Start split it ...")
    path = args.path
    moudle = args.moudle
    print(moudle)
    other_ags = args.other
    if moudle=='RegReplace':
        RegReplace.RegReplace(path,other_ags.split(',')[0],other_ags.split(',')[1],other_ags.split(',')[2])
    if moudle=='PasReplace':
        PasReplace.PasReplace(path,other_ags.split(',')[0],other_ags.split(',')[1])
    if moudle=='KJReplace':
        ControlReplace.ControlReplace(path,other_ags.split(',')[0],other_ags.split(',')[1])
