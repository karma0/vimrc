" File: karma0/config.vim
" This has options that I tend to use on different machines a lot (like macOS
" and Linux).

func! karma0#config#setup() abort
  if xolox#misc#os#is_mac()
    call karma0#config#for_macosx()
  else " I don't run Neovim on anything else, so this has to be Linux.
    call karma0#config#for_linux()
  endif

  call karma0#config#load_local()
endfunc

func! karma0#config#for_linux() abort
  " TODO: Figure out Linux (KDE, Ubuntu) specific options.
endfunc

func! karma0#config#for_macosx() abort
  " TODO: Figure out macOS-specifically useful options.
endfunc

func! karma0#config#load_local() abort
  try
    source $HOME/.config/nvim/local.vim
  catch /*/
    echomsg 'No local configuration.'
  endtry
endfunc
