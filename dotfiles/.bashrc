# Use Vim as the default editor
export EDITOR=vim

# Resets both foreground and background colors
color_reset="\[\e[0m\]"

set_bash_prompt() {
  # Swaps foreground and background colors
  local color_invert="$(get_bash_color "7")"

  # `\w` is the working directory
  local directory_part="$color_invert\w"

  # `get_git_part` will be executed every prompt.
  local git_part="$color_reset $color_invert\$(get_git_part)"

  # `\$` displays # or $ depending on whether the user is running as root
  local prompt_part="$color_invert\$$color_reset"

  # Set the Bash prompt
  export PS1="\n$directory_part$git_part\n$prompt_part "
}

get_git_part() {
  # We want the exit status from `git symbolic-ref`; we don't care about its
  # output.
  #
  # The use of `--quiet` is necessary. Without it, `git symbolic-ref` will
  # return the standard error status of `128` if HEAD is detached.
  git symbolic-ref --quiet HEAD &>/dev/null

  # We use that exit status to determine the status of the current
  # repository, if there is one.
  case $? in
    # An exit status of 0 indicates we're in a Git repository with HEAD at
    # the tip of a branch.
    0)
      local branch="$(git symbolic-ref --short HEAD)"
      printf "%s" "($branch)"
      ;;

    # An exit status of 1 indicates we're in a Git repository with HEAD
    # detached.
    1)
      local hash="$(git rev-parse HEAD)"
      # `%h` is the shortened hash of the commit; %s is the subject.
      local summary="$(git log -n 1 $commitHash --pretty=format:'%h: %s')"
      printf "%s" "<detached $summary>"
      ;;
  esac
}

get_bash_color() {
  printf "%s" "$color_reset\[\033[$1m\]"  
}

set_bash_prompt

