# Defined via `source`
function config --wraps='cd ~/.config' --description 'alias config cd ~/.config'
  cd ~/.config $argv; 
end
