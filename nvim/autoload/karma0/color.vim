func! karma0#color#tweak() abort
  call karma0#color#modify_highlighting()

  let g:nord_terminal_italics = 1
endfunc

func! karma0#color#modify_highlighting() abort
  hi notesDoubleQuoted gui=italic cterm=italic
  hi notesSingleQuoted gui=italic cterm=italic
  hi notesBold cterm=bold gui=bold
  hi notesItalic cterm=italic gui=italic
  hi VertSplit ctermbg=NONE guibg=NONE
  hi Split ctermbg=NONE guibg=NONE
endfunc

func! karma0#color#apply() abort
  syntax on
  exec('colorscheme ' . g:karma0.color.scheme)
  call airline#switch_theme(g:karma0.color.airline_theme)
  exec('set background=' . g:karma0.color.background)
endfunc

func! karma0#color#setup() abort
  call karma0#color#apply()
  call karma0#color#tweak()
endfunc
