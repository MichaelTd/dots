#!/usr/bin/env bash
# bootstrap.sh
# The means to migrate my .dots in new systems.

if [[ "${1}" != "thoushallnotpass" ]]; then
  printf "Read this first: https://github.com/MichaelTd/dots/\n"
  exit 1
fi

dtfls="$(cd $(dirname ${BASH_SOURCE[0]})/dot.files && pwd)"
tofldr="${HOME}"
fx=".$(date +%s)"
ls=$(which ls) # alias workaround

declare -a fls=( $(${ls} -A ${dtfls}) )

for file in ${fls[@]}; do
  if [[ -L "${tofldr}/${file}" || -d "${tofldr}/${file}" || -f "${tofldr}/${file}" ]]; then
    mv -f "${tofldr}/${file}" "${tofldr}/${file}${fx}"
  fi
  ln -sf "${dtfls}/${file}" "${tofldr}/${file}"
done