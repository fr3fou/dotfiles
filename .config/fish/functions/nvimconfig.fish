# Defined via `source`
function nvimconfig --wraps='nvim ~/.config/nvim/init.lua' --wraps='nvim ~/.config/nvim/init.vim' --description 'alias nvimconfig nvim ~/.config/nvim/init.vim'
  nvim ~/.config/nvim/init.vim $argv; 
end
