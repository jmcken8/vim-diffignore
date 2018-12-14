let g:DiffIgnore = []

function DiffIgnoreAdd(...)
    for i in a:000
        call add(g:DiffIgnore, i)
    endfor
    diffu
endfunction
function DiffIgnoreRemove(...)
    for i in a:000
        let ind = index(g:DiffIgnore, a:expression)
        if ind == -1
            echoerr "Expression '" . a:expression . "' does not exist."
        else
            call remove(g:DiffIgnore, a:i)
        endif
    diffu
endfunction
function DiffIgnoreList()
    echo g:DiffIgnore
endfunction
set diffexpr=DiffIgnoreRerun()
function DiffIgnoreRerun()
    let opt = ""
    for ignoreOption in g:DiffIgnore
        let opt = opt . "-I \"" . ignoreOption . "\" "
    endfor
    if &diffopt =~ "icase"
        let opt = opt . "-i "
    endif
    if &diffopt =~ "iwhite"
        let opt = opt . "-b "
    endif
    call system("diff -d -a --binary " . opt . v:fname_in . " " 
            \ . v:fname_new . " > " . v:fname_out)
    redraw!
endfunction 

