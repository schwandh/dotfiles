# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

# Returns the current branch
#
git_branch() {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

# Returns the color code to use for a Dirty or Clean branch
#
# 0;31 -      RED - If it is dirty
#    0 - No Color - If it is dirty
#
git_dirty_color() {
  local RED='0;31'
  local NO_COLOR='0'

  st=$(git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ${NO_COLOR}
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo ${NO_COLOR}
    else
      echo ${RED}
    fi
  fi
}

# Returns the checked out branch if there is one.
# 
git_prompt_info () {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
	st=$(git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    printf "(${ref#refs/heads/}) "
  fi
}

# Returns unpushed commit logs in shrort form
#
unpushed () {
  git cherry -v origin/$(git_branch) 2>/dev/null
}

# Returns a '+ ' if there are unpushed items - empty string otherwise.
#
need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo "+ "
  fi
}

# Generates a prompt of the form
#
#  '[+ ][(CURRENT_BRANCH)] CURRENT_FOLDER > '
#  
# e.g. of prompt in app folder of a master branch with unpushed commits
#  '+ (master) app > '
#
# e.g. of prompt in app folder of a master branch without unpushed commits
#  '(master) app > '
#
# e.g. of prompt in app folder of a non git repo 
#  ' app > '
#
# Note: The branch will be colored also if it is dirty
#
get_prompt () {
	# PS1 will only evaluate escape sequences once. This means that they cannot change.
	# Thus to allow color changes we need to only change the color value.
	
  local OPEN_COLOR="\[\033["
  local CLOSE_COLOR="m\]"
	local LIGHT_BLUE="${OPEN_COLOR}1;36${CLOSE_COLOR}"
  local NO_COLOR="${OPEN_COLOR}0${CLOSE_COLOR}"

  printf "${LIGHT_BLUE}\$(need_push)${NO_COLOR}${OPEN_COLOR}\$(git_dirty_color)${CLOSE_COLOR}\$(git_prompt_info)${NO_COLOR}\\W > "
}

PS1=$(get_prompt)