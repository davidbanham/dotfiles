# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

alias list='cat /Users/davidbanham/.bash_profile | grep alias'
alias tunnel='ssh -D 8080 sirbabau@dbanham.com'
alias officetunnel='ssh -D 8080 kermit.pinion.gg'
alias dbanham='ssh sirbabau@dbanham.com'
alias dbe='ssh babau@dbe.cc'
alias server='ssh home.dbe.cc'
alias oscar='ssh oscar.pinion.gg'
alias kermit='ssh kermit.pinion.gg'
alias pinion='ssh pinionco@pinion.co'

alias updatedb='sudo /usr/libexec/locate.updatedb'

##
# Your previous /Users/davidbanham/.bash_profile file was backed up as /Users/davidbanham/.bash_profile.macports-saved_2010-12-26_at_22:30:13
##

# MacPorts Installer addition on 2010-12-26_at_22:30:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=$PATH:/usr/bin/android-sdk-mac/tools/

export PATH=/usr/local/git/bin:$PATH 

export PATH=$PATH:/Users/davidbanham/node_modules/.bin/

export PATH=$PATH:/Users/davidbanham/bin/

export PATH=$PATH:/Users/davidbanham/.bin/

# Line to enable Node Version Manager - https://github.com/creationix/nvm
. ~/.nvm/nvm.sh

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
