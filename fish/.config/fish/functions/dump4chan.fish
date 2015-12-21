function dump4chan --description 'Downloads images from given 4chan thread url'
    wget --directory-prefix=. --span-hosts --no-directories --recursive --execute="robots=off" --domains=i.4cdn.org --accept="*.jpg,*.png,*.gif,*.webm" --reject="*s.jpg" --no-clobber $argv
end
