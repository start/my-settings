# Use Vim as the default editor
export EDITOR=vim

# This resets both foreground and background colors. This'll be used when
# constructing the Bash prompt
color_reset="\[\e[0m\]"

# Gets a Bash color from its color code
get_bash_color() {
  local color_code="$1"
  printf "%s" "$color_reset\[\033[${color_code}m\]"  
}

set_bash_prompt() {
  # Swaps foreground and background colors
  local color_invert="$(get_bash_color "7")"

  # `\w` is the working directory
  local directory="$color_invert\w"

  # `get_git_part` will be executed every prompt
  local git_branch="$color_invert\$(get_git_part)"

  # `\$` displays # or $ depending on whether the user is running as root
  local prompt_char="$color_invert\$"

  # Reset the color before each space (though for now, there's just one
  # space)
  local space="$color_reset "

  # Example: 
  # ~/projects/broodwar-remake (master)
  local dir_info_line="$directory$space$git_branch"

  # Example:
  # $
  local prompt_line="$prompt_char"

  # Reset the color before each newline
  local newline="$color_reset\n"

  # Set the Bash prompt
  export PS1="$newline$dir_info_line$newline$prompt_line$space"
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
      # `%h` is the shortened hash of the commit; `%s` is the subject.
      local summary="$(git log -n 1 $commitHash --pretty=format:'%h: %s')"
      printf "%s" "<detached $summary>"
      ;;
  esac
}

set_bash_prompt

