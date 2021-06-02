# fnm


if command -s fnm > /dev/null
  set PATH /home/starkers/.fnm $PATH
  fnm env | source
else
  echo 'WARN: fnm not installed'
end
