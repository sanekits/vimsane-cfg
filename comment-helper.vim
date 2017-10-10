" comment-helper.vim
"
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

    "  Use <leader>1 (the number 1, not lower-case L) to toggle  comments.  Add
    "  new file types above as needed.
    nnoremap <leader>1 :call ToggleComment()<cr>
    vnoremap <leader>1 :call ToggleComment()<cr>

