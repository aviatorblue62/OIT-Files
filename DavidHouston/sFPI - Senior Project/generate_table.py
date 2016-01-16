#! /usr/bin/python

import sys, os, re

tabledoc = open('rampfunc.txt','a')
next_line = 0
for i in range(0,4095):
	print i
	string = str(i) + '\n'
	tabledoc.write(string)

tabledoc.close()
sys.exit()
