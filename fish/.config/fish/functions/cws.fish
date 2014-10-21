function cws --description 'Cleans up unnecessary white spaces from file.'
    perl -i -l -p -e 's/\s*$//' $argv
    and perl -0 -i -pe 's/\s*$/\n/' $argv
end
