" The vim ctags management for projects
" Author:       jrmbrgs
" Version:      0.0.1
" License:      MIT

" Don't source the plug-in when it's already been loaded or &compatible is set.
if &cp || exists('g:projectsCtagsLoaded')
  finish
endif

if !exists('g:projectNameList') || empty(g:projectNameList)
    throw "Please define g:projectNameList"
endif


" Make sure the plug-in is only loaded once.
let g:projectsCtagsLoaded = 1
