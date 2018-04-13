" repo-init.vim
" Initializes repmo plugin, see plugin/repmo.vim
"
" map a motion and its reverse motion:
:noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
:noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

:noremap <expr> e repmo#SelfKey('e', 'b')|sunmap e
:noremap <expr> E repmo#SelfKey('E', 'B')|sunmap E

:noremap <expr> b repmo#SelfKey('b', 'e')|sunmap b
:noremap <expr> B repmo#SelfKey('B', 'E')|sunmap B

:noremap <expr> w repmo#SelfKey('w', 'b')|sunmap w
:noremap <expr> W repmo#SelfKey('W', 'B')|sunmap W

" I don't understand what 'ZapKey' does.
" :noremap <expr> t repmo#ZapKey('t', 'T')|sunmap t
" :noremap <expr> T repmo#ZapKey('T', 't')|sunmap T
" :noremap <expr> f repmo#ZapKey('f')|sunmap f
" :noremap <expr> F repmo#ZapKey('F')|sunmap F

" if you like `:noremap j gj', you can keep that:
:map <expr> j repmo#Key('gj', 'gk')|sunmap j
:map <expr> k repmo#Key('gk', 'gj')|sunmap k

" repeat the last [count]motion or the last zap-key. semicolon
" and pipe are mirrors:
:map <expr> ; repmo#LastKey(';')|sunmap ;
:map <expr> <bar> repmo#LastRevKey('<bar>')|sunmap <bar>

" add these mappings when repeating with `;' or `,':
" :noremap <expr> f repmo#ZapKey('f')|sunmap f
" :noremap <expr> F repmo#ZapKey('F')|sunmap F
" :noremap <expr> t repmo#ZapKey('t')|sunmap t
" :noremap <expr> T repmo#ZapKey('T')|sunmap T

