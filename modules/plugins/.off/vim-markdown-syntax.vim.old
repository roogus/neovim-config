" Plug 'gabrielelana/vim-markdown'
" https://github.com/gabrielelana/vim-markdown

" To disable support for Jekyll files (enabled by default with: 1)
let g:markdown_include_jekyll_support = 0
" To Enable the fold expression markdown#FoldLevelOfLine to fold markdown files. This is disabled by default because it's a huge performance hit even when folding is disabled with the nofoldenable option (disabled by default with: 0)
let g:markdown_enable_folding = 0
" To disable default mappings (enabled by default with: 1)
let g:markdown_enable_mappings = 0
" To disable insert mode mappings (enabled by default with: 1)
let g:markdown_enable_insert_mode_mappings = 0
" To enable insert mode leader mappings (disabled by default with: 0)
let g:markdown_enable_insert_mode_leader_mappings = 0
" To disable spell checking (enabled by default with: 1)
let g:markdown_enable_spell_checking = 1
" To disable abbreviations for punctuation and emoticons (enabled by default with: 1)
let g:markdown_enable_input_abbreviations = 1
" To enable conceal for italic, bold, inline-code and link text (disabled by default with: 0)
let g:markdown_enable_conceal = 1

" Default Mappings (normal and visual mode)
" mappings are local to markdown buffers
" <Space> (NORMAL_MODE) switch status of things:
" Cases
" A list item * item becomes a check list item * [ ] item
" A check list item * [ ] item becomes a checked list item * [x] item
" A checked list item * [x] item becomes a list item * item
" Can be changed with g:markdown_mapping_switch_status = '<Leader>s
" <Leader>ft (NORMAL_MODE) format the current table
" <Leader>e (NORMAL_MODE, VISUAL_MODE) :MarkdownEditCodeBlock edit the current code block in another buffer with a guessed file type. The guess is based on the start of the range for VISUAL_MODE. If it's not possible to guess (you are not in a recognizable code block like a fenced code block) then the default is markdown. If it's not possible to guess and the current range is a single line and the line is empty then a new code block is created. It's asked to the user the file type of the new code block. The default file type is markdown.
" Optional Mappings (insert mode)
" 
" mappings are local to markdown buffers
" 
" <Leader>ft (INSERT_MODE) same as NORMAL_MODE <Leader>ft with an additional mapping for INSERT_MODE
" <Leader>e (INSERT_MODE) same as NORMAL_MODE and VISUAL_MODE <leader>e with an additional mapping for INSERT_MODE
" Motions
" 
" ]] start of the next header
" [[ start of the previous header
" While Editing in Insert Mode
" 
" | in a table triggers the format command
" <Tab>/<S-Tab> on a list indents/unindents the item
" <Tab>/<S-Tab> on a blockquote increases/decreases the quote level
" <Enter> on a list item with no text in it (freshly created) deletes everything up to column 0
" Development
" 
" Resources
" 
" Markdown GitHub Syntax
" Markdown GitHub API
" Markdown GitHub Quick Preview
" Syntax Specs
" 
" Testing syntax highlighting can be tricky. Here I use the golden master pattern to at least avoid regressions. This is how it works: in ./rspec/features you will find a bunch of *.md files, one for each syntactic element supported. For each of those files there's an HTML file. This file is created with the :TOhtml command and it's the reference (aka golden master) of the syntax highlight of the original file. Running rspec compares the current syntax highlighting of all the feature's files with the reference syntax highlighting. If you see something wrong when looking at some of the feature's files, you can fix it and then regenerate the golden master files with GENERATE_GOLDEN_MASTER=1 rspec
" 
" Known Bugs
" 
" formatlistpat doesn't work for ordered lists
" formatoptions thinks that * in horizontal rules are list items
