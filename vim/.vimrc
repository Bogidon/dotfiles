" github amix/vimrc

let vim_runtime = $HOME . '/.dotfiles/vim/amix_vimrc' 

execute 'set runtimepath+=' . vim_runtime

execute 'source ' . vim_runtime . '/vimrcs/basic.vim'
execute 'source ' . vim_runtime . '/vimrcs/filetypes.vim'
execute 'source ' . vim_runtime . '/vimrcs/plugins_config.vim'
execute 'source ' . vim_runtime . '/vimrcs/extended.vim'

" My .vimrc
let NERDTreeShowHidden=1

