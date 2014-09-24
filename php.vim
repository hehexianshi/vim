"php function 
"author lidong
"
"
"
func! Phpclass(name)
    call setline(1, "<?php")
    call append(line("."), "class ". a:name)
    call append(line(".")+1, "{")
    call append(line(".")+2, "    public function __construct()")
    call append(line(".")+3, "    {")
    call append(line(".")+4, "    }")
    call append(line(".")+5, "    public function __destruct()")
    call append(line(".")+6, "    {")
    call append(line(".")+7, "    }")
    call append(line(".")+8, "}")
endfunction
