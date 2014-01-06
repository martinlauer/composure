#!/bin/sh

# detect available testing shells
KSH=$(which ksh 2>/dev/null)
ZSH=$(which zsh 2>/dev/null)
BASH=$(which bash 2>/dev/null)

echo "got KSH: $KSH"
echo "got ZSH: $ZSH"
echo "got BASH: $BASH"

# run wvtests against available shells
typeset test shell
for test in t/*.sh; do
  for shell in $BASH $KSH $ZSH; do
    echo TESTFILE="$test" SHELL=$shell $shell $test
    TESTFILE="$test" SHELL=$shell $shell $test
    [ $? -ne 0 ] && exit $?
  done
done

exit 0
