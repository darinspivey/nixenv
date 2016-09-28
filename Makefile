BASEDIR			= ${HOME}

VIMRC			= ${BASEDIR}/.vimrc
VIMDIR			= ${BASEDIR}/.vim
VIMRCBACKUP		= $$(dirname $(VIMRC))/$$(basename $(VIMRC)).ORIG
TMUXCONF 		= ${BASEDIR}/.tmux.conf
TMUXDIR			= ${BASEDIR}/.tmux
GITAWAREDIR 	= ${BASEDIR}/.git-aware-prompt

isEnvSet 		= $(shell bash -lc 'if [ -z $${GITAWAREPROMPT+x} ]; then echo "unset"; else echo $$GITAWAREPROMPT; fi')

.ONESHELL:
myvim: cleanMyVim
	ln -s ${PWD}/vim/vimrc ${VIMRC}
	if [ ! -d $(VIMDIR) ]; then mkdir -p $(VIMDIR); fi
	@echo "Unpacking myVimDir..."
	tar xvf ${PWD}/vim/myVimDir.tar -C ${VIMDIR}

mytmux: cleanMyTmux cloneTmux
	ln -s ${PWD}/tmux/tmux.conf ${TMUXCONF}
	${TMUXDIR}/plugins/tpm/bin/install_plugins

mygitaware: cleanGitAware cloneGitAware

ifeq ($(isEnvSet),unset)
	@echo "\n# *** nixenv Makefile additions ***" >> $(BASEDIR)/.bash_profile
	@echo "export GITAWAREPROMPT=$(GITAWAREDIR)" >> $(BASEDIR)/.bash_profile
	@echo "source \$$GITAWAREPROMPT/main.sh" >> $(BASEDIR)/.bash_profile
	@echo 'export PS1="\u@\h \w \[$$txtcyn\]\$$git_branch\[$$txtred\]\$$git_dirty\[$$txtrst\]\$$ "' >> $(BASEDIR)/.bash_profile
else
	@echo Skipping .bashrc modification for git-aware-prompt.  Environment already set: $(isEnvSet)
endif

cloneGitAware:
	@echo Cloning git-aware-prompt...
	git clone https://github.com/jimeh/git-aware-prompt.git $(GITAWAREDIR)

cloneTmux:
	@echo "Installing tpm plugin for tmux..."
	git clone https://github.com/tmux-plugins/tpm ${TMUXDIR}/plugins/tpm
    
cleanGitAware: FORCE
	rm -rf ${GITAWAREDIR}

cleanMyTmux: FORCE
	rm -rf ${TMUXCONF} ${TMUXDIR}

cleanMyVim: FORCE
	@if [[ -f $(VIMRC) && ! -f $(VIMRCBACKUP) ]]; then cp $(VIMRC) $(VIMRCBACKUP) && echo \* Backed up $$(basename $(VIMRC)) to $(VIMRCBACKUP); fi
	rm -rf ${VIMRC} ${VIMDIR}

clean: FORCE cleanGitAware cleanMyTmux cleanMyVim

install: myvim mytmux mygitaware

all: install

FORCE:

