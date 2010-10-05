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