"Removes all trailing white space in current buffer
fun! RemoveTrailingWhiteSpace()
    call CurPos("save")
    %s/\s*$//
    call CurPos("restore")
endfun

"Lets you save a file you forgot to open with sudo
fun! SaveReadOnlyFile()
    w !sudo tee %
endfun

"Saves/Restores Cursor position
"http://vim.wikia.com/wiki/Maintain_cursor_and_screen_position
function CurPos(action)
  if a:action == "save"
    let b:saveve = &virtualedit
    let b:savesiso = &sidescrolloff
    set virtualedit=all
    set sidescrolloff=0
    let b:curline = line(".")
    let b:curvcol = virtcol(".")
    let b:curwcol = wincol()
    normal! g0
    let b:algvcol = virtcol(".")
    normal! M
    let b:midline = line(".")
    execute "normal! ".b:curline."G".b:curvcol."|"
    let &virtualedit = b:saveve
    let &sidescrolloff = b:savesiso
  elseif a:action == "restore"
    let b:saveve = &virtualedit
    let b:savesiso = &sidescrolloff
    set virtualedit=all
    set sidescrolloff=0
    execute "normal! ".b:midline."Gzz".b:curline."G0"
    let nw = wincol() - 1
    if b:curvcol != b:curwcol - nw
      execute "normal! ".b:algvcol."|zs"
      let s = wincol() - nw - 1
      if s != 0
        execute "normal! ".s."zl"
      endif
    endif
    execute "normal! ".b:curvcol."|"
    let &virtualedit = b:saveve
    let &sidescrolloff = b:savesiso
    unlet b:saveve b:savesiso b:curline b:curvcol b:curwcol b:algvcol b:midline
  endif
  return ""
endfunction


"Mostly from http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
function QuickFixToggle()
    if !exists("g:genUtils_QFix")
        let g:genUtils_QFix = 0
    endif
    if g:genUtils_QFix
        cclose
        let g:genUtils_QFix = 0
        execute g:genUtils_QFix_Return . "wincmd w"
    else
        let g:genUtils_QFix_Return = winnr()
        copen
        let g:genUtils_QFix = 1
    endif
endfunction


"Set up commands to make calling above functions easier
command! -nargs=0 NoTrail call RemoveTrailingWhiteSpace()
command! -nargs=0 ForceSave call SaveReadOnlyFile()
command! -nargs=0 QFixToggle call QuickFixToggle()
cmap w!! call SaveReadOnlyFile()
