if [[ ! -o interactive ]]; then
    return
fi

compctl -K _vms vms

_vms() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(vms commands)"
  else
    completions="$(vms completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
