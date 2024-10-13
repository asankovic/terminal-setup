" ============================ Leader key  =============================
noremap <SPACE> <Nop>
let mapleader=" "
" ======================================================================

" ========================== Common settings  ==========================
set visualbell
set mouse=a
set updatetime=250

set list
"set listchars=tab:»\ ,trail:·,nbsp:␣
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

"using https://plugins.jetbrains.com/plugin/7414-relative-line-numbers for side by side display
set relativenumber
set number

set tabstop=2
set shiftwidth=2
set expandtab
" set autoindent
" set smartindent
set shiftround
set breakindent
set scrolloff=10
set sidescrolloff=5

set cursorline
set nowrap
set showmode

set ignorecase
set smartcase
set hlsearch
set incsearch
" ======================================================================

" ========================== General remaps  ===========================
"" Show register content
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

"" Exit insert mode
inoremap jk <ESC>

"" Quality of life things
nnoremap Q <Nop>
nnoremap U <C-r>

" Turn off highlighted search
nnoremap <Esc> :nohlsearch<CR>

" Disable space key in normal and visual modes
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>

"" Moving to start and end of line
nnoremap L g_
nnoremap H ^
xnoremap L g_
xnoremap H ^
onoremap L g_
onoremap H ^

"" Insert new empty line
nmap zj o<ESC>k
nmap zk O<ESC>j

"" Indent keeping selection
xnoremap < <gv
xnoremap > >gv
xnoremap = =gv

" Select everything
nnoremap == gg<S-v>G

"" Toggle case and start typing
map <leader>ui ~hi
"" Remove selection and toggle case
xmap <leader>ud d~h

" Search for highlighted text
vnoremap // "sy/<C-R>s<CR>

" Yank to system register
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from system register
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Move selected line up or down
"vnoremap K :m '<-2<CR>gv=gv
"vnoremap J :m '>+1<CR>gv=gv

" Join line without losing the cursor position
nnoremap J mzJ`z

" Scroll up and down keeping the screen aligned
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Keep the selection in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv
" ======================================================================

if has("ide")
        " =========================== Idea specific  ===========================
        set ideajoin
        set ideamarks
        set ideastatusicon=gray
        set idearefactormode=keep
        " ----------------------------------------------------------------------

        " ------------------------------ Plugins  ------------------------------
        " https://github.com/JetBrains/ideavim/wiki/IdeaVim-Plugins
        set highlightedyank
        set NERDTree
        "set sneak
        set surround
        set argtextobj
        set multiple-cursors
        set quickscope
        set vim-paragraph-motion
        set ReplaceWithRegister
        set textobj-entire
        set textobj-indent
        set easymotion
        set commentary
        set exchange
        " set matchit

        "" Var configs
        let g:argtextobj_pairs = "[:],(:),<:>"
        let g:highlightedyank_highlight_color = "rgba(202, 148, 226, 155)"
        let g:exchange_indent = "=="
        let g:qs_primary_color = "#FF0000"
        let g:qs_secondary_color = "#FF1493"
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
        " let b:match_words = "<:>,<tag>:</tag>,if:fi"

        "" exchange - for some reason need to redefine it
        xmap X <Plug>(Exchange)
        "nmap <leader>e :NERDTree <CR>
        nmap - :NERDTreeToggle <CR>


        "" multiple-cursors
        nmap ma <Plug>AllWholeOccurrences
        nmap mg <Plug>AllOccurrences
        nmap mc <Plug>NextWholeOccurrence
        nmap mx <Plug>SkipOccurrence
        nmap mb <Plug>RemoveOccurrence
        xmap ma <Plug>AllWholeOccurrences
        xmap mg <Plug>AllOccurrences
        xmap mc <Plug>NextWholeOccurrence
        xmap mx <Plug>SkipOccurrence
        xmap mb <Plug>RemoveOccurrence
        " ----------------------------------------------------------------------

        " -------------------------- Intellij Actions  -------------------------
        " https://jb.gg/abva4t
        "" Navigation
        nmap <C-o> <Action>(Back)
        nmap <C-i> <Action>(Forward)
        nmap [[ <Action>(MethodUp)
        nmap ]] <Action>(MethodDown)
        nmap gs <Action>(GotoSuperMethod)
        nmap gi <Action>(GotoImplementation)
        nmap g; <Action>(JumpToLastChange)
        nmap g, <Action>(JumpToNextChange)
        " Go to usage and declaration are the same action in IntelliJ
        "nmap gu <Action>(GotoDeclaration)
        nmap gd <Action>(GotoDeclaration)
        nmap gt <Action>(GotoTypeDeclaration)
        nmap <leader>fe <Action>(RecentFiles)
        " gc collides with commentary
        map <leader>fc <Action>(GotoClass)
        map <leader>ff <Action>(GotoFile)
        nmap g: <Action>(GotoAction)
        map <leader>fa <Action>(FindInPath)
        nmap <leader>fs <Action>(FileStructurePopup)

        "" Usages
        nmap <leader>fU <Action>(FindUsages)
        nmap <leader>fu <Action>(ShowUsages)
        "nmap <leader>uh <Action>(HighlightUsagesInFile)

        "" Tests and running
        nmap <leader>rr <Action>(RunClass)
        "nmap <leader>gt <Action>(GotoTest)
        nmap <leader>rg <Action>(hybris.groovy.execute.commit.mode.off)

        "" Generating
        "nmap <leader>ns <Action>(NewScratchFile)
        nmap <leader>ge <Action>(Generate)
        nmap <leader>im <Action>(ImplementMethods)
        nmap <leader>or <Action>(OverrideMethods)

        "" Formatting
        nmap <leader>fo <Action>(ReformatCode)<Action>(OptimizeImports)
        xmap <leader>fo <Action>(ReformatCode)
        nmap <leader>fd <Action>(ShowReformatFileDialog)
        nmap ga <Action>(ShowIntentionActions)
        map <leader>re <Action>(RenameElement)

        "" Quick manipulating lines
        xmap K <Action>(MoveLineUp)
        xmap J <Action>(MoveLineDown)
        nmap J <Action>(EditorJoinLines)

        "" Extracting
        map <leader>ev <Action>(IntroduceVariable)
        map <leader>em <Action>(ExtractMethod)
        map <leader>ec <Action>(IntroduceConstant)
        map <leader>ef <Action>(IntroduceField)
        map <leader>ep <Action>(IntroduceParameter)
        map <leader>s <Action>(SurroundWith)
        "Kotlin overrides
        "map <leader>em <Action>(ExtractFunction)
        "map <leader>ef <Action>(IntroduceProperty)

        "" Code completion
        imap ;; <Action>(CodeCompletion)
        nmap <C-l> <Action>(EditorCompleteStatement)
        imap <C-l> <Action>(EditorCompleteStatement)

        "" Windows and editor tabs
        nnoremap gk gt
        nnoremap gj gT
        "todo
        nmap <leader>ww <Action>(CloseEditor)
        nmap <leader>wu <Action>(CloseAllEditorsButActive)
        nmap <leader>qq <Action>(HideAllWindows)
        nmap <leader>qe <Action>(HideActiveWindow)
        nmap <leader>ee <Action>(ActivateProjectToolWindow)
        "nmap <leader>dw <Action>(ActivateDebugToolWindow)
        "nmap <leader>xx <Action>(ActivateProblemsViewToolWindow)
        nmap <leader>we <Action>(JumpToLastWindow)

        "" Hierarchies
        nmap <leader>hc <Action>(CallHierarchy)
        nmap <leader>ht <Action>(TypeHierarchy)
        nmap <leader>hm <Action>(MethodHierarchy)

        "" Bookmarks
        nmap <C-m> <Action>(ToggleBookmark)
        "nmap <leader>fm <Action>(ShowBookmarks)
        nmap <leader>fm <Action>(ActivateBookmarksToolWindow)

        "" Expanding and collapsing
        nmap zc <Action>(CollapseRegion)
        nmap zo <Action>(ExpandRegion)
        nmap zC <Action>(CollapseAllRegions)
        nmap zO <Action>(ExpandAllRegions)

        "" Debug
        nmap <leader>dd <Action>(Debug)
        nmap <leader>dn <Action>(StepOver)
        nmap <leader>do <Action>(StepOut)
        nmap <leader>di <Action>(StepInto)
        nmap <leader>dr <Action>(Resume)
        nmap <leader>ds <Action>(Stop)
        nmap <leader>dc <Action>(RunToCursor)
        map <leader>de <Action>(EvaluateExpression)
        nmap <leader>db <Action>(ToggleLineBreakpoint)
        nmap <leader>dt <Action>(XDebugger.MuteBreakpoints)
        nmap <leader>fb <Action>(ViewBreakpoints)

        "" Others
        nmap K <Action>(ShowHoverInfo)
        nmap [d <Action>(GotoPreviousError)
        nmap ]d <Action>(GotoNextError)
        nmap <leader>he <Action>(QuickList.Noob board)
        nmap <leader>hw <Action>(QuickList.Look at all those windows)
        nmap <leader>ii <Action>(QuickImplementations)
        nmap <leader>ip <Action>(ParameterInfo)
        nmap <leader>it <Action>(ExpressionTypeInfo)
        nmap <leader>cr <Action>(CopyReference)
        " Git
        nmap ]g <Action>(VcsShowNextChangeMarker)
        nmap [g <Action>(VcsShowPrevChangeMarker)
        nmap <leader>gd <Action>(Vcs.ShowDiffChangedLines)
        nmap <leader>gb <Action>(Annotate)
        nmap <leader>gh <Action>(Vcs.ShowTabbedFileHistory)
        nmap <leader>zm <Action>(ToggleZenMode)
        "Harpoon
        nmap <leader>ha <Action>(GotoHarpoon1)
        nmap <leader>hs <Action>(GotoHarpoon2)
        nmap <leader>hd <Action>(GotoHarpoon3)
        nmap <leader>hf <Action>(GotoHarpoon4)
        nmap <leader>hg <Action>(GotoHarpoon5)

        nmap <leader>Ha <Action>(SetHarpoon1)
        nmap <leader>Hs <Action>(SetHarpoon2)
        nmap <leader>Hd <Action>(SetHarpoon3)
        nmap <leader>Hf <Action>(SetHarpoon4)
        nmap <leader>Hg <Action>(SetHarpoon5)

        nmap <leader>fh <Action>(ShowHarpoon)
        nmap <leader>hh <Action>(AddToHarpoon)

        nmap <D-l> <Action>(NextProjectWindow)
        "nmap <D-h> <Action>()
        " ======================================================================
endif