" Vim Configuration File
" Author: Ross Merriam

execute pathogen#infect()    


syntax on    " syntax highlighting 


" Spaces and Tabs
set tabstop=4    " number of visual spaces per TAB
set softtabstop=4    " number of spaces in tab when editing
filetype indent on    " load filetype-specific indent files


" UI Config
set number    " show line numbers
set showcmd    " show command in bottom bar
set cursorline    " highlight current line


:colorscheme pencil


