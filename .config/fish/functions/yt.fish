# Defined via `source`
function yt --wraps=youtube-dl --description 'alias yt youtube-dl'
  youtube-dl $argv; 
end
