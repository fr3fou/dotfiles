# Defined via `source`
function dots --wraps="git --git-dir=$HOME/.dots.git/ --work-tree=$HOME" --description "alias dots git --git-dir=$HOME/.dots.git/ --work-tree=$HOME"
  git "--git-dir=$HOME/.dots.git/" "--work-tree=$HOME" $argv; 
end
