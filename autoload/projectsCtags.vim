" The vim ctags management for projects
" Author:       jrmbrgs


" Returns the absolute path the current file belongs to
" According to the 
"
" @throws  Error  if not able to detect the project
" @returns String current project absolute path
function! projectsCtags#GetProjectAbsolutePath()
    let currentDir = getcwd()
    if !exists('g:projectNameList') || empty(g:projectNameList)
        throw "Please define g:projectNameList"
    endif
    for projectName in g:projectNameList
        let projectMatchDir = matchstr(currentDir, '\c\(.*/' . projectName . '\)')
        if empty(projectMatchDir) 
            continue
        endif
        return projectMatchDir
    endfor
    throw "Not in a known project"
endfunction

" Returns the absolute path the current file belongs to
"
" @throws  Error  if not able to detect the project
" @returns String current project absolute path
function! projectsCtags#GenCtags()
    if ( !has_key(g:ctagsLang, &ft))
        throw 'CTags gen does not support "' . &ft . '" lang yet'
    endif
    try
        let projectAbsoluteDir = projectsCtags#GetProjectAbsolutePath()
    catch
        echo 'failed'
    endtry
    let ctagsCmd = printf('%s -f %s/%s %s',g:ctagsLang[&ft], projectAbsoluteDir, g:tagFile, projectAbsoluteDir)
    if (!empty(ctagsCmd))
        let vimCmd = printf('sh -c "%s 1>%s 2>%s"', ctagsCmd, '/tmp/ctagsout', '/tmp/ctagserr')
        execute "!" . vimCmd
        "execute redraw!
    endif
endfunction
