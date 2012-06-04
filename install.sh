#!/bin/bash

createSymbolicLink() {
    if [ -e $2 ] || [ -h $2 ]
    then
        fileType=`file -b $2 | cut -d' ' -f1,2`
        link=`file -b $2 | cut -d'\`' -f2`
        option=""
        if [ "$fileType" = "symbolic link" ]
        then
            if [ "$link" = "$1'" ]
            then
                echo "    ✓ $2 → $1"
                return
            fi
        fi
        if [ "$fileType" = "broken symbolic" ]
        then
            msg="  \"$2\" is a broken symbolic link! Replace it? [y/n]: "
        else
            msg="  \"$2\" already exists! Replace it with a symbolic link? [y/n]: "
        fi
        while [ "$option" != "y" ] && [ "$option" != "n" ]
        do
            echo "$msg"
            read option
            if [ "$option" = "y" ] || [ "$option" = "n" ]
            then
                if [ "$option" = "y" ]
                then
                    rm -rf $2
                    ln -fs $1 $2
                    echo "    ✓ $2 → $1"
                else
                    echo "    ✗ $2 → $1"
                fi
            fi
        done
    else
        ln -s $1 $2
        echo "    ✓ $2 → $1"
    fi
}

original_path="`pwd`"
cd "`dirname "$0"`"
path=`pwd`
cd "$original_path"

echo "Creating symbolic links..."
createSymbolicLink "$path/.bash_aliases" "$HOME/.bash_aliases"
createSymbolicLink "$path/.bash_profile" "$HOME/.bash_profile"
createSymbolicLink "$path/.bashrc" "$HOME/.bashrc"
createSymbolicLink "$path/.gitconfig" "$HOME/.gitconfig"
createSymbolicLink "$path/.inputrc" "$HOME/.inputrc"
createSymbolicLink "$path/.screenrc" "$HOME/.screenrc"
createSymbolicLink "$path/.tmux.conf" "$HOME/.tmux.conf"
createSymbolicLink "$path/.vim" "$HOME/.vim"
createSymbolicLink "$path/.vimrc" "$HOME/.vimrc"
createSymbolicLink "$path/.xmodmap" "$HOME/.xmodmap"
createSymbolicLink "$path/.xsession" "$HOME/.xsession"
