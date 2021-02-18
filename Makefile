.PHONY: install
install: bootstrap neovim

.PHONY: bootstrap
bootstrap:
	@command -v git nvim stow > /dev/null

.PHONY: update
update: install
	git add -A
	@git commit --allow-empty-message -m '' && git push || true

.PHONY: neovim
neovim:
	stow neovim
	nvim --headless +PlugInstall +qall

.PHONY: tmux
tmux:
	stow tmux

.PHONY: ksh
ksh:
	stow ksh

.PHONY: pentest
pentest: tmux ksh


