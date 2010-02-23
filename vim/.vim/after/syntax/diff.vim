syn region foldedDiff start="^diff" end="^diff"me=s-1 fold transparent contains=TOP
set foldmethod=syntax

set fillchars="fold: "
set foldcolumn=1

function! DiffFoldText()
  let size = v:foldend - v:foldstart + 1

  let firstLine = getline(v:foldstart)
  let statusLine = getline(v:foldstart + 1)

  if match(statusLine, "^new file") > -1
    let type = "A---"
  elseif match(statusLine, "^deleted file") > -1
    let type = "---D"
  elseif match(statusLine, "^rename from") > -1
    let type = "--R-"
  elseif match(statusLine, "^copy from") > -1
    let type = "--C-"
  else
    let type = "-M--"
  endif

  if match(getline(v:foldstart + 2), "^GIT binary patch$") > -1
    let isbinary = "[BIN]"
  elseif match(getline(v:foldstart + 3), "^GIT binary patch$") > -1
    let isbinary = "[BIN]"
  else
    let isbinary = ""
  endif

  let filename = substitute(firstLine, 'diff --git a/.*\sb/', '', 'g')

  return printf("-%s-%4d lines: %5s %s", type, size, isbinary, filename)
endfunction
set foldtext=DiffFoldText()

" Fix some of the colors
hi link diffRemoved		PreProc
hi Folded	guibg=grey30 guifg=LightBlue
hi FoldColumn	guibg=grey30 guifg=Red
nmap <buffer> <Space> za
nmap Q ZQ
