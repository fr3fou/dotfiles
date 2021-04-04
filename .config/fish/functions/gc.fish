# Defined via `source`
function gc --wraps='git commit -v' --description 'alias gc git commit -v'
  git commit -v $argv; 
end
