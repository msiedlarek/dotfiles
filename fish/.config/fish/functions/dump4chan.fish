function dump4chan --description 'Downloads images from given 4chan thread url'
    wget --no-check-certificate -O - $argv | grep -Eo 'i.4cdn.org/[^"]+' | sed 's/^/https:\/\//' | sort | uniq | xargs wget --no-check-certificate --no-clobber
end
