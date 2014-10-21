function publicip --description 'Prints current public IP'
    dig +short myip.opendns.com @resolver1.opendns.com
end
