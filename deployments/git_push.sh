git config --global user.email "colin.murray@sozoglobal"
git config --global user.name "sozouser"
# Clone the whole azure repository
cd
git clone $GITREPO azure
# Add the compiled app
cd azure
rm -R -f *
cp -R -f ~/clone/dist/* .
git add -A
git commit -m "Code shipped"
# push to azure
git push origin
