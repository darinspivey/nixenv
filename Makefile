VIMRC			= ${HOME}/TEST.vimrc
VIMDIR			= ${HOME}/TEST.vim
TMUXCONF 		= ${HOME}/.tmux.conf
TMUXDIR			= ${HOME}/.tmux
GITAWAREDIR 	= ${HOME}/TEST.git-aware-prompt

myvim:
	ln -s ${PWD}/vim/vimrc ${VIMRC}
	tar xvf ${PWD}/vim/myVimDir.tar -C ${VIMDIR}

mytmux:
	git clone https://github.com/tmux-plugins/tpm ${TMUXDIR}/plugins/tpm
	ln -s ${PWD}/tmux/tmux.conf ${TMUXCONF}
	${TMUXDIR}/plugins/tpm/bin/install_plugins

mygitaware:

    
clean:
	rm -rf ${VIMRC} ${VIMDIR} ${TMUXCONF} ${TMUXDIR} ${GITAWAREDIR}

install: clean myvim mytmux mygitaware

all: install
