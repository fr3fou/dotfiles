# Defined via `source`
function tk --wraps='tmux kill-session' --wraps='tmux kill-session -t' --description 'alias tk tmux kill-session -t'
  tmux kill-session -t $argv; 
end
