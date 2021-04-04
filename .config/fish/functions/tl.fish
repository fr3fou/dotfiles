# Defined via `source`
function tl --wraps='tmux ls' --description 'alias tl tmux ls'
  tmux ls $argv; 
end
