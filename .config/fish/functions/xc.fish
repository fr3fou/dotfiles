# Defined via `source`
function xc --wraps='xclip -selection clipboard' --description 'alias xc xclip -selection clipboard'
  xclip -selection clipboard $argv; 
end
