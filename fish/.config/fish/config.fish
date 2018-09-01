set -g __fish_git_prompt_color_branch magenta 
set -g __fish_git_prompt_char_stagedstate "•"
set -g __fish_git_prompt_char_dirtystate "+"
set -g __fish_git_prompt_char_untrackedfiles "?"
set -g __fish_git_prompt_char_conflictedstate "×"
set -g __fish_git_prompt_char_cleanstate "✓"

if test -e ~/.profile
    source ~/.profile
end

# Enable colored grep output.
alias grep 'grep --color=auto'
