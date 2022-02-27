function virtualenv_info {
  [ -n "$VIRTUAL_ENV" ] && echo 'Virtualenv: ('$(basename $VIRTUAL_ENV)') '
}

#
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# %* time
# %1~ just show current dir
# %~ show full dir with ~ for user
LEFT="🌎 20%D %*"
RIGHT="🌍 $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
RIGHT=""
RIGHTWIDTH=$(($COLUMNS-45))
# RIGHTWIDTH=$(($COLUMNS-${#LEFT}-2))
PROMPT="
%F{6}$LEFT%f%F{blue}${(l:$RIGHTWIDTH:: :)RIGHT}🌍 $(date -u +"%Y-%m-%d %H:%M:%SZ")
%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%~%f%b \$vcs_info_msg_0_ %F{11}$(virtualenv_info)%f
%(!.#.$) "

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Don't use RPROMPT because it breaks copy pasting lines
# RPROMPT="\$vcs_info_msg_0_"
zstyle ':vcs_info:git:*' formats '%F{5}(%b)%f'
zstyle ':vcs_info:*' enable git

# Alternative to RPROMPT
# https://superuser.com/questions/974908/multiline-rprompt-in-zsh
# precmd() {
#   LEFT="🌎 $(date +"%Y-%m-%dT%H:%M:%SZ")"
#   RIGHT="🌍 $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
#   RIGHTWIDTH=$(($COLUMNS-${#LEFT}-2))
#   print $LEFT${(l:$RIGHTWIDTH:: :)RIGHT}
# }

# Fix cursor movement
bindkey -e

fpath+=~/.zfunc
