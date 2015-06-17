#!/usr/bin/env bash

git submodule update --init

declare -a resource
while read line ; do
  resource+=("${line}")
done < <(sed '1d' "manifest.yml" | cut -c4-)

case "$1" in
  'rm' )
    for r in "${resource[@]}" ; do
      target="$HOME/$r"
      if [[ -e "$target" ]] || [[ -L "$target" ]]; then
        rm -i -r "$target"
        echo "$target removed"
      else
        echo "$target does not exist: skipping"
      fi
    done
    ;;

  'init' )
    for r in "${resource[@]}" ; do
      src="$(pwd)/$r"
      target="$HOME/$r"
      if [[ ! -e "$target" ]] ; then
        src="${src#$HOME/}"

        slashes=$(($(echo "${target/$HOME/}" | grep -o '/' | wc -l) - 1))
        until [ "$slashes" -le 0 ] ; do
          src="../$src"
          slashes=$(($slashes - 1))
        done

        ln -s "$src" "$target"
        echo "$target linked"
      else
        echo "$target already exists: skipping"
      fi
    done
    ;;

  *)
    echo "install.sh: illegal mode $1" 1>&2
    echo "usage: ./install.sh [init|rm]" 1>&2
    exit 1
    ;;
esac
