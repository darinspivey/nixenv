brew install fish

---OR---
tar xzvf fish-3.0.2.tar.gz -C /tmp
cd /tmp/fish-3.0.2
./configure
make
sudo make install
rm -rf /tmp/fish-3.0.2

---THEN---
sudo echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish

# Install oh-my-fish (see README.md)

---FINALLY---
cd ~/nixenv/fish
cp *_prompt.fish ~/.config/fish/functions/.
