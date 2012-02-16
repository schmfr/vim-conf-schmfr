" REQUIRED: This makes vim invoke latex-suite when you open a tex file.
let g:tex_flavor = "latex"

" useful path's
set path+=~/Work/Resources/LaTeX/ 
set path+=~/Work/Resources/Bibliography/
set path+=~/Work/Talks/Archive/
set path+=~/Work/Teaching/Exercises/

" and Bibliography
:set tags+=~/Work/Resources/Bibliography/tags

" set iskeyword for a better completition
set iskeyword+=:
set iskeyword+=_

" Search for packages:
set suffixesadd+=.sty
set suffixesadd+=.cls

"ctag settings for latex
"http://www.unb.ca/fredericton/science/chem/ajit/vim.htm
"let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
"let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_tex_settings='latex;b:bibitem;c:command;e:environment;l:label'
let tlist_bib_settings='bibtex;a:article;b:book;m:misc;p:part;s:string;t:thesis'

" Forward Search
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'synctex_wrapper'

" Customization of labels of environments
let g:Tex_EnvLabelprefix_assumption = "assumption:"
let g:Tex_EnvLabelprefix_definition = "definition:"
let g:Tex_EnvLabelprefix_remark = "remark:"
let g:Tex_EnvLabelprefix_corollary = "corollary:"
let g:Tex_EnvLabelprefix_align = "equation:"
let g:Tex_EnvLabelprefix_equation = "equation:"
let g:Tex_EnvLabelprefix_subequations = "equation:"

" Created environments should end in <CR>+<++>
let g:Tex_EnvEndWithCR = 1
" Created labels before or after content?
let g:Tex_LabelAfterContent = 0


let g:Tex_FontMaps = 1 

"" DEBUG variable:
let g:Tex_Debug = 1

let g:Tex_BIBINPUTS = $HOME."/Work/Resources/Bibliography/"

"let g:Tex_Folding = 0
" Do not fold any Environments.
let g:Tex_FoldedEnvironments = ''
" Do not fold \item
let g:Tex_FoldedMisc = 'preamble,<<<'
" More fake*:
let g:Tex_FoldedSections = 'part,chapter,section,subsection,subsubsection,paragraph'

:cnoremap <space> <C-R>=Replace_space()<CR>
"" Replace spaces in search to map also line breaks
function! Replace_space()
	let cmdtype = getcmdtype()
	if cmdtype == '/' || cmdtype == '?'
		return "\\_s*"
	else
		return " "
	endif
endfunction

:cnoremap <backspace> <C-R>=Replace_backspace()<CR>
"" Replace backspaces in search to delete "\_s*"
function! Replace_backspace()
	let cmdtype = getcmdtype()
	if (cmdtype == '/' || cmdtype == '?')
		let cmdline = getcmdline()
		let cmdpos = getcmdpos()
		if ( cmdline[cmdpos-5 : cmdpos-2] =~ "\\\\_s\\*" )
			return ""
		else
			return ""
		endif
	else
		return ""
	endif
endfunction

" Environments:
let g:Tex_Env_block = "\\begin{block}{<++>}\<CR><++>\<CR>\\end{block}"
let g:Tex_Env_frame = "\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}"
"let g:Tex_Env_lemma = "\\begin{lemma}\<CR><++>\<CR>\\label{lem:<++>}\<CR>\\end{lemma}"
"let g:Tex_Env_theorem = "\\begin{theorem}\<CR><++>\<CR>\\label{thm:<++>}\<CR>\\end{theorem}"
"let g:Tex_Env_assumption = "\\begin{assumption}\<CR><++>\<CR>\\label{asm:<++>}\<CR>\\end{assumption}"
"let g:Tex_Env_definition = "\\begin{definition}\<CR><++>\<CR>\\label{def:<++>}\<CR>\\end{definition}"


