function cleandsstore --description 'Removes .DS_Store directories from tree'
    if [ $argv = "" ]
        set argv '.'
    end
    find $argv -name '.DS_Store*' -depth -exec rm -vrf '{}' \;
end
