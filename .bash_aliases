###################################################
# Aliases that I want everywhere
###################################################

alias l='ls -la'
alias sl='sl -e'
# alias vi='vim -g'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias col50="printf '=%.0s' {1..50}"  # 50 column ruler
alias col72="printf '=%.0s' {1..72}"  # 72 column ruler
alias col80="printf '=%.0s' {1..80}"  # 80 column ruler

export GREP_OPTIONS='--color=auto'
alias grep='grep -I'
alias fgrep='fgrep -I'
alias egrep='egrep -I'
alias rgrep='rgrep -I'

alias grepenv='env | grep'
alias grepdat='env | grep DATABASE'
alias greprl='env | grep URL'
alias grepurl='env | grep URL'
alias ttail='tail -n 50 -f'

alias fig="docker-compose"
alias dm="docker-machine"

alias ipchicken="curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'"

alias npmnuke="rm -rf node_modules && npm install"

# reset and clear
alias cls='printf "\ec"'

md () { mkdir -p "$@" && cd "$@"; }

alias dphd="phd --postdoc-dry-run"
alias qphd="phd --postdoc-quiet"
