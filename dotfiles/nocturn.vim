set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "nocturn"

hi Normal ctermbg=235
hi Statement ctermfg=220
hi Type ctermfg=40
hi PreProc ctermfg=124
hi link StorageClass Type
hi link Structure Type
hi Comment ctermfg=39
hi Constant ctermfg=165
hi Macro ctermfg=246
hi Identifier cterm=bold ctermfg=87
hi Special ctermfg=246
