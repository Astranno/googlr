echo "------------------------------------"
echo "Cloning Repo"
echo "------------------------------------"
mkdir ~/.googlr
cd ~/.googlr
git clone https://github.com/Camji55/googlr.git
echo "------------------------------------"
echo "Installing..."
echo "------------------------------------"
mv googlr/Source/googlr /usr/local/bin/googlr
rm -rf ~/.googlr
echo "Installed!"
echo "------------------------------------"