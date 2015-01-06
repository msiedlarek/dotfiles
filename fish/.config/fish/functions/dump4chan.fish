function dump4chan --description 'Downloads images from given 4chan thread url'
    wget -O - $argv | grep -Eo 'i.4cdn.org/[^"]+' | sed 's/^/https:\/\//' | sort | uniq | xargs wget --no-clobber
end
