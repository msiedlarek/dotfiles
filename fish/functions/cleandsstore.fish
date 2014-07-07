function cleandsstore --description 'Removes .DS_Store directories from tree'
    if [ -n $argv ]
        set argv '.'
    end
    find $argv -name '.DS_Store*' -depth -exec rm -vrf '{}' \;
end
