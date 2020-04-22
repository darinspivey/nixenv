# Install atom first
apm install --packages-file package-list.txt

# Copy .cson and .less files into ~/.atom (or better yet, LINK atom to the nixenv version)
cd $HOME/.atom
rm config.cson keymap.cson styles.less ;and \
  ln -s $HOME/nixenv/atom/config.cson ;and \
  ln -s $HOME/nixenv/atom/keymap.cson ;and \
  ln -s $HOME/nixenv/atom/styles.less ;and \
  ln -s $HOME/nixenv/atom/init.js


# Occasionally
apm list --installed --bare > ~/nixenv/atom/package-list.txt
# Then push nixenv to github
