tar xzvf fish-3.0.2.tar.gz -C /tmp
cd /tmp/fish-3.0.2
./configure
make
sudo make install
rm -rf /tmp/fish-3.0.2
sudo echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish
