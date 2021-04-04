# Defined via `source`
function dots --wraps='git --git-dir=/home/simo/.dots.git/ --work-tree=/home/simo' --description 'alias dots git --git-dir=/home/simo/.dots.git/ --work-tree=/home/simo'
  git --git-dir=/home/simo/.dots.git/ --work-tree=/home/simo $argv; 
end
