# direnv

if command -s direnv > /dev/null
  eval (direnv hook fish)
else
  echo 'WARN: direnv not installed'
end

