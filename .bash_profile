[ -n "$TERM_PROGRAM" ] && ponysay --quote
[ -f ~/.bashrc ] && source ~/.bashrc
[ -n "$TERM_PROGRAM" ] && [ -n "$VAULT_ADDR" ] && vault token renew > /dev/null &
