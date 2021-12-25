all: dotfiles update

dotfiles:
	test -e ~/.config/nvim || ln -sf $(pwd) ~/.config/nvi

update: plug go

plug:
	cd autoload && \
		curl -LO https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

go:
	test -d syntax || mkdir -p syntax
	cd syntax && ( \
		curl -LO https://raw.githubusercontent.com/fatih/vim-go/master/syntax/gohtmltmpl.vim ; \
		curl -LO https://raw.githubusercontent.com/fatih/vim-go/master/syntax/gomod.vim ; \
		curl -LO https://raw.githubusercontent.com/fatih/vim-go/master/syntax/gotexttmpl.vim ; )

