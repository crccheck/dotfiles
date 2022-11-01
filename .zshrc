# Set up the prompt
# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Command completion
autoload -Uz compinit
compinit

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

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
%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%~%f%b \$vcs_info_msg_0_ %F{11}\$(virtualenv_info)%f
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

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Now throw away all the promp work I did above and use Starship if it's installed
# if command -v starship > /dev/null; then eval "$(starship init zsh)"; fi
