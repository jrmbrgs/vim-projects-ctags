# vim-projects-ctags
_Ctags management for projects_


## Installation
You obviously noticed _ctags_ in the plugin name, so no surprise, it requires _exuberant-ctags_ so you need it to be installed ;)


I'm sure you'll prefer to install it w/ your fav VIm plugin manager (i.e. Plug)
`Plug 'jrmbrgs/vim-projects-ctags'`


## Usage
Help it to know your projects
```vimscript
" Define your projects list
let g:projectNameList = ['slingshot', 'turbo',]

" Define the target ctags file which will be stored at the current project root dir
let g:tagFile = '.tags'

" Define and customize your ctag cmd line according to the languages you want to support
let g:ctagsLang = {
    \   'php' : '/usr/local/bin/ctags -R --languages=PHP --file-scope=no --exclude=.git --recurse=yes --exclude=vendor --totals=yes --PHP-kinds=+ncf',
\}

" Map the ctags generation
map <Leader>pt :call projectsCtags#GenCtags()<cr>
```
