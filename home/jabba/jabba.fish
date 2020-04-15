# https://github.com/shyiko/jabba
# This file is intended to be "sourced" (i.e. ". ~/.jabba/jabba.fish")

set -xg JABBA_HOME "$HOME/.jabba"

function jabba
    set fd3 (mktemp /tmp/jabba-fd3.XXXXXX)
    env JABBA_SHELL_INTEGRATION=ON $HOME/.jabba/bin/jabba $argv 3> $fd3
    set exit_code $status
    eval (cat $fd3 | sed "s/^export/set -xg/g" | sed "s/^unset/set -e/g" | tr '=' ' ' | sed "s/:/\" \"/g" | tr '\\n' ';')
    rm -f $fd3
    return $exit_code
end

[ ! -z (echo (jabba alias default)) ]; and jabba use default
