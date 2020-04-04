# Install atom first
apm install --packages-file package-list.txt

# Copy .cson and .less files into ~/.atom (or better yet, LINK atom to the nixenv version)
cd $HOME/.atom
rm config.cson keymap.cson styles.less
ln -s $HOME/nixenv/atom/config.cson
ln -s $HOME/nixenv/atom/keymap.cson
ln -s $HOME/nixenv/atom/styles.less


# Occasionally
apm list --installed --bare > ~/nixenv/atom/package-list.txt
# Then push nixenv to github
