VIMRC			= ${HOME}/TEST.vimrc
VIMDIR			= ${HOME}/TEST.vim
TMUXCONF 		= ${HOME}/.tmux.conf
TMUXDIR			= ${HOME}/.tmux
GITAWAREDIR 	= ${HOME}/TEST.git-aware-prompt

isEnvSet 		= $(shell bash -lc 'if [ -z $${GITAWAREPROMPT+x} ]; then echo "unset"; else echo $$GITAWAREPROMPT; fi')

myvim: cleanMyVim
	ln -s ${PWD}/vim/vimrc ${VIMRC}
	@echo "Unpacking myVimDir..."
	@tar xvf ${PWD}/vim/myVimDir.tar -C ${VIMDIR}

mytmux: cleanMyTmux cloneTmux
	ln -s ${PWD}/tmux/tmux.conf ${TMUXCONF}
	${TMUXDIR}/plugins/tpm/bin/install_plugins

mygitaware: cleanGitAware cloneGitAware

ifeq ($(isEnvSet),"unset")
	@echo "\n*** nixenv Makefile additions ***" >> $(HOME)/.bash_profile
	@echo "GITAWAREPROMPT=$(GITAWAREDIR)" >> $(HOME)/.bash_profile
	@echo "source $$GITAWAREPROMPT/main.sh" >> $(HOME)/.bash_profile
	@echo 'export PS1="\u@\h \w \[$$txtcyn\]\$$git_branch\[$$txtred\]\$$git_dirty\[$$txtrst\]\$$ "' >> $(HOME)/.bash_profile
else
	@echo Skipping .bashrc modification for git-aware-prompt.  Environment already set: $(isEnvSet)
endif

cloneGitAware:
	@echo Cloning git-aware-prompt...
	git clone https://github.com/jimeh/git-aware-prompt.git $(GITAWAREDIR)

cloneTmux:
	@echo "Installing tpm plugin for tmux..."
	@git clone https://github.com/tmux-plugins/tpm ${TMUXDIR}/plugins/tpm
    
cleanGitAware: FORCE
	@rm -rf ${GITAWAREDIR}

cleanMyTmux: FORCE
	@rm -rf ${TMUXCONF} ${TMUXDIR}

cleanMyVim: FORCE
	@if [ -f $(VIMRC) ]; then cp $(VIMRC) $$(dirname $(VIMRC))/ORIG.$$(basename $(VIMRC)); fi
	@rm -rf ${VIMRC} ${VIMDIR}

darin:

clean: FORCE cleanGitAware cleanMyTmux cleanMyVim

install: clean myvim mytmux mygitaware

all: install

FORCE:

