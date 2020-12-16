#!/bin/bash
sudo apt-get update
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev # ruby compile dependencies
sudo apt-get install -y build-essential patch ruby-dev liblzma-dev # for nokogiri
sudo apt-get install -y gcc make # for compiling dynamic bash extensions to speed up rbenv
sudo apt-get install -y g++ 
sudo apt-get install -y libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev # phantomJS
sudo apt-get install -y dpkg-sig gdebi-core # stuff for installing packages

#######################
## RUBY
#######################

# rbenv
git clone https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv
cd /home/vagrant/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
source ~/.bashrc

# ruby-build (as rbenv plugin)
mkdir -p /home/vagrant/.rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build

# install ruby
NUM_CORES=$(grep -c ^processor /proc/cpuinfo)
MAKE_OPTS="-j $NUM_CORES" /home/vagrant/.rbenv/bin/rbenv install -s 2.5.0
/home/vagrant/.rbenv/bin/rbenv global 2.5.0

# install bundler
sudo /home/vagrant/.rbenv/shims/gem install bundler

# install some gems
sudo /home/vagrant/.rbenv/shims/gem install nokogiri

#######################
## NODE
#######################

# n (version manager)
n_tmp=$(mktemp -d)
git clone https://github.com/tj/n.git --depth=1 "$n_tmp"
sudo make -f "$n_tmp/Makefile" install

# install latest stable node
sudo n stable

#######################
## PYTHON
#######################
sudo apt-get install python3-pip
/home/vagrant/.local/bin/pip3 install pipenv

#######################
## R (only for Ubuntu 16.04)
#######################

# Installing R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get update
sudo apt-get install -y r-base

# RStudio
sudo apt-get install -y libxslt1-dev
rstudio_tmp="$(mktemp -d)/rstudio.deb"
wget -O "$rstudio_tmp" https://download1.rstudio.org/rstudio-xenial-1.1.447-amd64.deb
yes | sudo gdebi "$rstudio_tmp"
