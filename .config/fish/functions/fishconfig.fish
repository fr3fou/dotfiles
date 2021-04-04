# Defined via `source`
function fishconfig --wraps=' ~/.config/fish/config.fish' --wraps='nvim ~/.config/fish/config.fish' --description 'alias fishconfig nvim ~/.config/fish/config.fish'
  nvim ~/.config/fish/config.fish $argv; 
end
