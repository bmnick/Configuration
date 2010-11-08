
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible



" Backup options
set nobk					" Don't store backups except when necessary
set bdir=.,~/tmp,~/			" put backups here 
set bkc=auto				" backup style automatically chooses
set swf                 	" swap file on

" Command options
set history=500				" keep 50 lines of command line history
set showcmd					" display incomplete commands

" Display Options
set sbr=>>              	" show wrapped lines
set ruler					" show the cursor position all the time
set bg=dark					" nice colors for dark bg
set lbr						" nice linebreaks rather than randoms
set title					" allow the title to change on xterms
set vb						" visual bells for when no sound

" Search options
set incsearch				" do incremental searching
set smartcase				" ignore case when not capital
set ws						" search through wrapped lines

" Global indent options:  should be modified per filetype
set ai 						" maintain previous indentation

" Usability options
set warn					" warning messages when shell commands are used
set remap					" recursive remappings are allowed
set cf						" prevent stupid leaving unsaved
set backspace=indent,eol,start " allow backspacing over everything in insert
set nogd					" no confusing use of g in :s
set more					" have a pause when listing
set norl					" just to make sure nothing is backwards
set scr=22              " scroll by enough to keep one line the same
set swb=usetab          " check for other open files before new
set smc=2000			" stop syntax highlighting after col 3000
set wildignore=*.o,*.obj,*.exe,*.bak " ignore these for completion

" Tabbing options
set noet	        	" don't make tabs into spaces
set ts=4                " tabs = 4 spaces - enough space, not so much indent
set sw=4				" indentation with > does 4 spaces

" Folding options
" TODO this needs to be looked at - should it be in filetypes?
set nofen				" turn off folding for all the basic stuff
set foldclose=       " clean coding files
set foldlevel=5         " fold deep levels of code
set fdm=indent          " folds are set based on indentation

" Nifty vim command options
set nf="alpha,hex"      " Change letters and hex with ^a and ^x
set top			" turn tildeop on for tilde as an operator
set wmnu			" completion in enhanced mode
set wim=longest:full	" Pop up a menu for completing the name

" File completion to make it nicer
"set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : 
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"set nocp
"filetype plugin on
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"set cul

" Global line numbering options
set nu					" Enable line numbering
set nuw=6               " make it stay short for trivial programs

" Compatiblity options
set nosn                " allow long filenames

" Completion options
set sft                 " for programming completion

" Spelling options
set spell               " spell checking onzorz!!!1!11!!
set spf=~/.utf8.add   " spell file for adding words
set spl=en_us           " set language to US english
set sps=double          " spelling suggestion method

" Windowing options
set wmh=0			" windows not being used can be just status line
set wh=3			" 3 line minimum window size

" Global Tagging Options
set tr                  " preserve relative file directories to tag files

" Activate the statusline globally
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 

" Configure navigation command from CommandT
nmap <silent> <Leader>d :CommandT<CR>

if has("gui_macvim")
	set guifont=Menlo:h12
end
" globally set transparency for macvim
"if has("gui_running")
"	set transparency=10
"endif


" Change a few colors to make things look right
hi 	SpellBad 	ctermbg=5


" make nu option come on for .java .cpp .c type files

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Do some stuff to make tabs a little nicer
noremap <silent> <c-Tab> :tabn<CR>
noremap <silent> <c-s-Tab> :tabp<CR>
inoremap <silent> <c-Tab> <Esc>:tabn<CR>
inoremap <silent> <c-s-Tab> <Esc>:tabp<CR>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

	autocmd WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
	autocmd FocusGained * setlocal cursorline
	autocmd FocusLost * setlocal nocursorline
	autocmd Filetype java setlocal omnifunc=javacomplete#CompleteParamsInfo
	autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
	autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
	autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
	autocmd Filetype java setlocal efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
	autocmd Filetype java setlocal makeprg=ant
	autocmd Filetype jproperties setlocal omnifunc=javacomplete#CompleteParamsInfo
	autocmd Filetype jproperties setlocal efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
	autocmd Filetype jproperties setlocal makeprg=ant

	"autocmd BufEnter * lcd %:p:h 

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

colorscheme molokai

" twitvim configuration
let twtivim_enable_python = 1
let twitvim_browser_cmd = '/Applications/Safari.app/Contents/MacOS/Safari'

noremap <Leader>p :NERDTreeToggle<CR>
