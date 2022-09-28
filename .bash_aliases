###################################################
# Aliases that I want everywhere
###################################################

alias l='ls -la'
alias la='ls -A'
alias ll='ls -l'
alias sl='sl -e'
# alias vi='vim -g'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias col50="printf '=%.0s' {1..50}"  # 50 column ruler
alias col72="printf '=%.0s' {1..72}"  # 72 column ruler
alias col80="printf '=%.0s' {1..80}"  # 80 column ruler
alias cls='printf "\ec"'

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
alias digs="dig +short"

alias cov='coverage report --skip-covered --show-missing'
alias covit='open coverage/lcov-report/index.html'
alias cows='for cow in $(cowsay -l); do cowsay -f $cow "$cow"; done'
alias ipchicken="curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'"
# curl ipinfo.io
alias utc='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias hurl='curl -sD - -o /dev/null'

# Docker
alias fig="docker-compose"
figup () { docker-compose up -d $@ && docker-compose logs -f --tail 20 $@; }
alias figlogs='docker-compose logs -f --tail=40'
alias dm="docker-machine"
alias zz='docker run --rm -v "${PWD}":/data -w /data -it crccheck/zz'

# NodeJS
alias nn="npm run"
alias npm="npm --no-fund"
alias npmnuke="[ -f package.json ] && rm -rf node_modules package-lock.json && mkdir node_modules && touch node_modules/.metadata_never_index && npm install"
alias gitnpmnuke='[ -f package.json ] && rm -rf node_modules package-lock.json && mkdir node_modules && npm install && git commit -am "chore(deps): regenerate package-lock.json"'
alias nodemont='nodemon --exec npm test'
alias nodemons='nodemon --exec npm start'
alias npmfix="sed -i -e 's/http:\/\//https:\/\//g' package-lock.json"

# Find shortcuts
alias dsdamn="find . -name '.DS_Store' -delete"
alias syndamn='find . -name "*sync-conflict*"'

# Reset and clear
alias cls='printf "\ec"'
# iterm does its own thing
if [ ! -z "${ITERM_PROFILE}" ]; then
  alias cls="printf '\e]50;ClearScrollback\a'"
fi

md () { mkdir -p "$@" && cd "$@"; }

alias dphd="phd --postdoc-dry-run"
alias qphd="phd --postdoc-quiet"

sssh () { ssh -t $@ "screen -rx -S crc"; }
alias mv='mv -iv'
alias cp='cp -iv'
PORT=8000
alias dj='echo -en "\033]0;dj :$PORT\a"; django runserver 0.0.0.0:$PORT'
alias djp='django runserver_plus 0.0.0.0:$PORT'
alias djs="django shell"
alias djsp="django shell_plus"
alias djsql="django debugsqlshell"
alias djadminme='django createsuperuser --username=admin --email=admin@example.com || django createsuperuser --email=admin@example.com'
alias attach="$HOME/bin/grabssh ; screen -d -r"
alias befs="bundle exec foreman start"
alias ag='ag --path-to-ignore ~/.ignore_global'
alias agit='ag --path-to-ignore ~/.ignore_global --ignore "*.it.js" --ignore "*.spec.js" --ignore "*.spec.mjs"'
