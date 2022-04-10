"let g:nvim_agda_settings = {'agda': '/usr/bin/agda', 'agda_args': [ '--i /home/roogus/.agda/lib/ial/', '-c']}
"let g:nvim_agda_settings = {'agda': '/usr/bin/agda-mode'}

lua << EOF
local nvim_agda = require('agda')
EOF
