# Defined via `source`
function temp --wraps='cd ~/temp' --wraps='cd ~/.temp' --description 'alias temp cd ~/.temp'
  cd ~/.temp $argv; 
end
