syn match todoMarkdownPrefix /^\s*-\s*/ contained containedin=todoMarkdownTaskItem,todoMarkdownDoneItem,todoMarkdownAddedItem
syn match todoMarkdownCheckBox /\[ \]/ contained containedin=todoMarkdownTaskItem,todoMarkdownDoneItem,todoMarkdownAddedItem
syn match todoMarkdownCheckedBox /\[x\]/ contained containedin=todoMarkdownTaskItem,todoMarkdownDoneItem
syn match todoMarkdownAddedBox /\[-\]/ contained containedin=todoMarkdownTaskItem,todoMarkdownAddedItem
syn match todoMarkdownDate /!(\d\{4}-\w\{2}-\w\{2})/ contained containedin=todoMarkdownTaskItem,todoMarkdownDoneItem,todoMarkdownAddedItem,todoMarkdownListItem

syn match todoMarkdownDoneItem /\(\s*\)-\s*\[x\]\s*[^\n]\+\n\(  \1\s*-[^\n]\+\n\)*/
syn match todoMarkdownTaskItem /\(\s*\)-\s*\[ \]\s*[^\n]\+\n/
syn match todoMarkdownAddedItem /\(\s*\)-\s*\[-\]\s*[^\n]\+\n/
syn match todoMarkdownListItem /\(\s*\)-\s[^\n\[\]]\+\n/

hi todoMarkdownPrefix ctermfg=Cyan cterm=none guifg=#00CCCC gui=none
hi todoMarkdownCheckBox ctermfg=Yellow guifg=#FFCC33
hi todoMarkdownCheckedBox ctermfg=Blue guifg=#00CCFF
hi todoMarkdownAddedBox ctermfg=Magenta guifg=#CC99CC
hi todoMarkdownDate ctermfg=Green guifg=#CCFF00

hi todoMarkdownDoneItem ctermfg=gray cterm=strikethrough guifg=#CCCCCC gui=strikethrough
hi todoMarkdownAddedItem ctermfg=gray cterm=bold guifg=#CCCCCC gui=bold
