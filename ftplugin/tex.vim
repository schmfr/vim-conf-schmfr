" Forward Search
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'synctex_wrapper'

" Customization of labels of environments
let g:Tex_EnvLabelprefix_assumption = "asm:"
let g:Tex_EnvLabelprefix_definition = "def:"
let g:Tex_EnvLabelprefix_remark = "rem:"
let g:Tex_EnvLabelprefix_corollary = "cor:"
let g:Tex_EnvLabelprefix_align = "eq:"
let g:Tex_EnvLabelprefix_equation = "eq:"
let g:Tex_EnvLabelprefix_subequations = "eq:"

" Created environments should end in <CR>+<++>
let g:Tex_EnvEndWithCR = 1
" Created labels before or after content?
let g:Tex_LabelAfterContent = 0


let g:Tex_FontMaps = 0 

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
let g:Tex_Env_lemma = "\\begin{lemma}\<CR><++>\<CR>\\label{lem:<++>}\<CR>\\end{lemma}"
let g:Tex_Env_theorem = "\\begin{theorem}\<CR><++>\<CR>\\label{thm:<++>}\<CR>\\end{theorem}"
let g:Tex_Env_assumption = "\\begin{assumption}\<CR><++>\<CR>\\label{asm:<++>}\<CR>\\end{assumption}"
let g:Tex_Env_definition = "\\begin{definition}\<CR><++>\<CR>\\label{def:<++>}\<CR>\\end{definition}"


