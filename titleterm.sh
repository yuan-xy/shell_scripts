#! /bin/sh

# titleterm - Tells the Mac OS X Terminal application to change its title
#   to the value specified as an argument to this succinct script.

if [ $# -eq 0 ]; then
  echo "Usage: $0 title" >&2
  exit 1
else
  echo -ne "\033]0;$1\007"
fi

exit 0

