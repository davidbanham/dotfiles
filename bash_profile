# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

alias list='cat /Users/davidbanham/.bash_profile'
alias tunnel='ssh -D 8080 sirbabau@dbanham.com'
alias officetunnel='ssh -D 8080 kermit.pinion.gg'
alias office='ssh -p 2200 l4dserver@office.oiminc.com.au'
alias dbanham='ssh sirbabau@dbanham.com'
alias dbe='ssh babau@dbe.cc'
alias delivery='ssh delivery.oiminc.com.au'
alias server='ssh home.dbe.cc'
alias ranking='ssh 111.67.2.170'
alias voip='ssh voip.crnr.com.au'
alias ernie='ssh ernie.oiminc.com.au'
alias hypernia='ssh 203.217.24.12'
alias proto='ssh vps.oiminc.com.au'
alias bigbird='ssh bigbird.oiminc.com.au'
alias oscar='ssh oscar.oiminc.com.au'
alias bert='ssh bert.oiminc.com.au'
alias count='ssh count.oiminc.com.au'
alias kermit='ssh kermit.oiminc.com.au'
alias pinion='ssh pinionco@pinion.co'

alias updatedb='sudo /usr/libexec/locate.updatedb'

##
# Your previous /Users/davidbanham/.bash_profile file was backed up as /Users/davidbanham/.bash_profile.macports-saved_2010-12-26_at_22:30:13
##

# MacPorts Installer addition on 2010-12-26_at_22:30:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=$PATH:/usr/bin/android-sdk-mac/tools/

export PATH=/usr/local/git/bin:$PATH 
