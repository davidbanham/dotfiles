#! /usr/bin/env python2
import subprocess
 
def get_pw():
    return subprocess.check_output(["/home/davidbanham/.bin/get_pass.sh"])
