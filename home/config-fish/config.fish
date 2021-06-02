#fish


# this section ensures the right side of the prompt stays clear
function fish_right_prompt
 #intentionally left blank
end


function fish_greeting
  # fortune
end



if command -s starship > /dev/null
  starship init fish | source
else
  echo 'WARN: starship not installed'
end



