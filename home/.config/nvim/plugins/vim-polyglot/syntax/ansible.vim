if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'ansible') == -1
  
" Vim syntax file
" Language: Ansible YAML/Jinja templates
" Maintainer: Dave Honneffer <pearofducks@gmail.com>
" Last Change: 2015.09.06

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'yaml'
endif

let b:current_syntax = ''
unlet b:current_syntax
runtime! syntax/yaml.vim

let b:current_syntax = ''
unlet b:current_syntax
syntax include @Yaml syntax/yaml.vim

let b:current_syntax = ''
unlet b:current_syntax
syntax include @Jinja syntax/jinja2.vim

" Jinja
" ================================

syn cluster jinjaSLSBlocks add=jinjaTagBlock,jinjaVarBlock,jinjaComment
" https://github.com/mitsuhiko/jinja2/blob/6b7c0c23/ext/Vim/jinja.vim
syn region jinjaTagBlock matchgroup=jinjaTagDelim start=/{%-\?/ end=/-\?%}/ containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaRaw,jinjaString,jinjaNested,jinjaComment,@jinjaSLSBlocks
syn region jinjaVarBlock matchgroup=jinjaVarDelim start=/{{-\?/ end=/-\?}}/ containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaRaw,jinjaString,jinjaNested,jinjaComment,@jinjaSLSBlocks
syn region jinjaComment matchgroup=jinjaCommentDelim start="{#" end="#}" containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaString,@jinjaSLSBlocks
highlight link jinjaVariable Constant
highlight link jinjaVarDelim Delimiter

" YAML
" ================================

" Reset some YAML to plain styling
" the number 80 in Ansible isn't any more important than the word root
highlight link yamlInteger NONE
highlight link yamlBool NONE
highlight link yamlFlowString NONE
" but it does make sense we visualize quotes easily
highlight link yamlFlowStringDelimiter Delimiter

fun! s:normal_keywords_highlight(name)
  if a:name == 'Comment'
    highlight link ansible_normal_keywords Comment
  elseif a:name == 'Constant'
    highlight link ansible_normal_keywords Constant
  elseif a:name == 'Identifier'
    highlight link ansible_normal_keywords Identifier
  elseif a:name == 'Statement'
    highlight link ansible_normal_keywords Statement
  elseif a:name == 'PreProc'
    highlight link ansible_normal_keywords PreProc
  elseif a:name == 'Type'
    highlight link ansible_normal_keywords Type
  elseif a:name == 'Special'
    highlight link ansible_normal_keywords Special
  elseif a:name == 'Underlined'
    highlight link ansible_normal_keywords Underlined
  elseif a:name == 'Ignore'
    highlight link ansible_normal_keywords Ignore
  elseif a:name == 'Error'
    highlight link ansible_normal_keywords Error
  elseif a:name == 'Todo'
    highlight link ansible_normal_keywords Todo
  endif
endfun

fun! s:with_keywords_highlight(name)
  if a:name == 'Comment'
    highlight link ansible_with_keywords Comment
  elseif a:name == 'Constant'
    highlight link ansible_with_keywords Constant
  elseif a:name == 'Identifier'
    highlight link ansible_with_keywords Identifier
  elseif a:name == 'Statement'
    highlight link ansible_with_keywords Statement
  elseif a:name == 'PreProc'
    highlight link ansible_with_keywords PreProc
  elseif a:name == 'Type'
    highlight link ansible_with_keywords Type
  elseif a:name == 'Special'
    highlight link ansible_with_keywords Special
  elseif a:name == 'Underlined'
    highlight link ansible_with_keywords Underlined
  elseif a:name == 'Ignore'
    highlight link ansible_with_keywords Ignore
  elseif a:name == 'Error'
    highlight link ansible_with_keywords Error
  elseif a:name == 'Todo'
    highlight link ansible_with_keywords Todo
  endif
endfun

fun! s:attribute_highlight(attributes)
  if a:attributes =~ 'a'
    syn match ansible_attributes "\v\w+\=" containedin=yamlPlainScalar
  else
    syn match ansible_attributes "\v^\s*\w+\=" containedin=yamlPlainScalar
  endif
  if a:attributes =~ 'n'
    highlight link ansible_attributes NONE
  elseif a:attributes =~ 'd'
    highlight link ansible_attributes Comment
  else
    highlight link ansible_attributes Structure
  endif
endfun

if exists("g:ansible_attribute_highlight")
  call s:attribute_highlight(g:ansible_attribute_highlight)
else
  call s:attribute_highlight('ad')
endif

if exists("g:ansible_name_highlight")
  syn keyword ansible_name name containedin=yamlBlockMappingKey contained
  if g:ansible_name_highlight =~ 'd'
    highlight link ansible_name Comment
  else
    highlight link ansible_name Underlined
  endif
endif

syn keyword ansible_debug_keywords debug containedin=yamlBlockMappingKey contained
highlight link ansible_debug_keywords Debug

if exists("g:ansible_extra_keywords_highlight")
  syn keyword ansible_extra_special_keywords register always_run changed_when failed_when no_log args vars delegate_to ignore_errors containedin=yamlBlockMappingKey contained
  highlight link ansible_extra_special_keywords Statement
endif

syn keyword ansible_normal_keywords include until retries delay when only_if become become_user block rescue always notify containedin=yamlBlockMappingKey contained
if exists("g:ansible_normal_keywords_highlight")
  call s:normal_keywords_highlight(g:ansible_normal_keywords_highlight)
else
  highlight link ansible_normal_keywords Statement
endif

syn match ansible_with_keywords "\vwith_.+" containedin=yamlBlockMappingKey contained
if exists("g:ansible_with_keywords_highlight")
  call s:with_keywords_highlight(g:ansible_with_keywords_highlight)
else
  highlight link ansible_with_keywords Statement
endif

let b:current_syntax = "ansible"

endif