# vi: ft=fish


if command -s ~/.software/bin/fnm > /dev/null
  set PATH /home/starkers/.fnm $PATH


  function find_up
    set path (pwd)
    while true
      if test -e "$path/$argv[1]"
        echo "$path/$argv[1]"
        return
      end
      if test -e "$path/$argv[2]"
        echo "$path/$argv[2]"
        return
      end
      if test $path = "/"
        return
      end
      set path (dirname $path)
    end
  end

  function fnm_use
    set current (string replace "v" "" (fnm current))
    set target (string replace "v" "" $argv[1])
    if test $current != $target
      ~/.software/bin/fnm use $argv[1] --log-level=quiet
    end
  end

  function _fnm_autoload_hook --on-variable PWD --description 'Change Node version on directory change'
    status --is-command-substitution; and return
    set found (find_up .nvmrc .node-version)
    if test -n "$found"
      fnm_use (cat $found)
    else
      fnm_use system
    end
  end

  ~/.software/bin/fnm env | source

# VSCode open integrated terminal does not trigger PWD hook
  if test "$TERM_PROGRAM" = "vscode"
    _fnm_autoload_hook
  end
else
  echo 'WARN: fnm not installed'
end
