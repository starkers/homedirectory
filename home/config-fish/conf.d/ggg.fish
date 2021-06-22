# vi: ft=fish

if status is-interactive
  if command -s ggg > /dev/null
    ggg hook fish | source
  else
    echo 'WARN: "ggg" binary not installed'
  end
end

