#fish


# this section ensures the right side of the prompt stays clear
function fish_right_prompt
 #intentionally left blank
end


if command -s direnv > /dev/null
  eval (direnv hook fish)
else
  echo 'WARN: direnv not installed'
end


if command -s starship > /dev/null
  starship init fish | source
else
  echo 'WARN: starship not installed'
end

