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

alias grepenv='env | grep'
alias grepdat='env | grep DATABASE'
alias greprl='env | grep URL'
alias grepurl='env | grep URL'
alias ttail='tail -n 50 -f'

alias update="sudo apt-get update"
alias install="sudo apt-get install"
alias upgrade="sudo apt-get safe-upgrade"
alias remove="sudo apt-get remove"

alias fig="docker-compose"
alias dm="docker-machine"
alias zz="docker run --rm -v \${PWD}:/data -w /data -it crccheck/zz"

alias ipchicken="curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'"

alias npmnuke="rm -rf node_modules && npm install"

# Reset and clear
alias cls='printf "\ec"'
# iterm does its own thing
if [ ! -z "${ITERM_PROFILE}" ]; then
  alias cls="printf '\e]50;ClearScrollback\a'"
fi

md () { mkdir -p "$@" && cd "$@"; }

alias dphd="phd --postdoc-dry-run"
alias qphd="phd --postdoc-quiet"
