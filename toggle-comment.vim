" toggle-comment.vim

" Commenting blocks of code.
" --------------------------
    let s:comment_map = {
    \   "c": '// ',
    \   "cpp": '// ',
    \   "csc2": '# ',
    \   "go": '// ',
    \   "java": '// ',
    \   "javascript": '// ',
    \   "make": '# ',
    \   "php": '// ',
    \   "python": '# ',
    \   "ruby": '# ',
    \   "tex": '%',
    \   "vim": '" ',
    \   "sh": '# ',
    \   "plaintex": '% ',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^" . comment_leader
            " Uncomment the line
            execute "silent s/^" . comment_leader . "//"
        else
            " Comment the line
            execute "silent s/^/" . comment_leader . "/"
        endif
    else
        echo "No comment leader found for filetype"
    end
endfunction

