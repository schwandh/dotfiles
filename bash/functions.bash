last_modified()
{
	/bin/ls -t $* 2> /dev/null | head -n 1
}

h() 
{
  cd ~/$1;	
}

_h() # autocomplete for h 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=`/bin/ls ~/`

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _h h

c() 
{
  cd $PROJECTS/$1;	
}

_c() # autocomplete for c 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=`/bin/ls $PROJECTS`

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _c c

_rake()  # autocomplete for rake
{
	local cur prev opts recent
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

	if [ -f Rakefile ]; then
    recent=`last_modified .rake_tasks~ Rakefile **/*.rake`
    if [[ $recent != '.rake_tasks~' ]]; then
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks~
    fi
    opts=`cat .rake_tasks~`
  fi

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}
complete -F _rake rake

# credit: http://nparikh.org/notes/zshrc.txt
# Usage: smartextract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
smartextract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar -jxvf $1 ;;
            *.tar.gz) tar -zxvf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.dmg) hdiutil mount $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar -xvf $1 ;;
            *.tbz2) tar -jxvf $1 ;;
            *.tgz) tar -zxvf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *) echo "'$1' cannot be extracted/mounted via smartextract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
