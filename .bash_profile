[ -f ~/.bashrc ] && source ~/.bashrc
[ -n "$TERM_PROGRAM" ] && ponysay --quote
[ -n "$TERM_PROGRAM" ] && [ -n "$VAULT_ADDR" ] && (vault token renew > /dev/null &)
# [ -n "$TERM_PROGRAM" ] && [ -n "$VAULT_ADDR" ] && (vault token renew --format=json | jq -c &)
