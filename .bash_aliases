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

alias rgrep='grep -r'
alias grepenv='env | grep'
alias grepdat='env | grep DATABASE'
alias greprl='env | grep URL'
alias grepurl='env | grep URL'
alias ttail='tail -n 50 -f'

alias update="sudo apt-get update"
alias install="sudo apt-get install"
alias upgrade="sudo apt-get upgrade"
alias remove="sudo apt-get remove"

alias adp="arc diff --preview --browse"
alias cov='coverage report --skip-covered --show-missing'
alias fig="docker-compose"
alias dm="docker-machine"
alias zz='docker run --rm -v "${PWD}":/data -w /data -it crccheck/zz'

alias cows='for cow in $(cowsay -l); do cowsay -f $cow "$cow"; done'
alias ipchicken="curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'"

alias nn="npm run"
alias npmnuke="[ -f package.json ] && rm -rf node_modules && mkdir node_modules && touch node_modules/.metadata_never_index && npm install"
alias nodemont='nodemon --exec npm test'
alias nodemons='nodemon --exec npm start'
alias nvm='[ -f .nvmrc ] && n $(cat .nvmrc) || echo "MISSING: .nvmrc"'
alias dsdamn="find . -name '.DS_Store' -delete"
alias syndamn='find . -name "*sync.conflict*"'

# Reset and clear
alias cls='printf "\ec"'
# iterm does its own thing
if [ ! -z "${ITERM_PROFILE}" ]; then
  alias cls="printf '\e]50;ClearScrollback\a'"
fi

md () { mkdir -p "$@" && cd "$@"; }

alias dphd="phd --postdoc-dry-run"
alias qphd="phd --postdoc-quiet"
