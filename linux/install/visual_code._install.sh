#! /bin/bash
wget https://github.com/codercom/code-server/releases/download/1.604-vsc1.32.0/code-server1.604-vsc1.32.0-linux-x64.tar.gz
tar xvfz code-server1.604-vsc1.32.0-linux-x64.tar.gz
cd code-server1.604-vsc1.32.0-linux-x64
mv code-server /bin
cd ..
rm -rf code-server1.604-vsc1.32.0-linux-x64
rm code-server1.604-vsc1.32.0-linux-x64.tar.gz

#mkdir myapp
#code-server