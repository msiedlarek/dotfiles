function noext --description 'Return given filename without the extension'
    echo $argv | sed 's/\.[^\.]*$//'
end
