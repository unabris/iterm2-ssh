function tabc() {
  # If you have trouble with this, change "Default" to the name of your default theme
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
  echo -e "\033]50;SetProfile=$NAME\a"
}

function tab-reset() {
  # If you have trouble with this, change "Default" to the name of your default theme
  NAME="Default"
  echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    trap "tab-reset" INT EXIT
    # Here you can add or remove all "<name>@*" you want.
    if [[ "$*" =~ "root@*|ubuntu@*" ]]; then
      tabc SSH
    fi
  fi
  ssh $*
}

compdef _ssh tabc=ssh

alias ssh="colorssh"
