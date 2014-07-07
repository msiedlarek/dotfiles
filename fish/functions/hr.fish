function hr --description 'Prints horizontal line in terminal'
    printf "\n"
    and printf "=%.0s" (seq (tput cols))
    and printf "\n\n"
end
