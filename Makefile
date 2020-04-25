.PHONY: update
update: install
	git add -A
	git commit --allow-empty-message -m '' && git push

.PHONY: install
install: bootstrap neovim

.PHONY: neovim
neovim:
	stow neovim
	nvim --headless +PlugInstall +qall

.PHONY: bootstrap
bootstrap:
	@command -v git nvim stow > /dev/null
