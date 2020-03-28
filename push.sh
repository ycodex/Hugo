#!/bin/bash

cd themes
git clone https://github.com/baalajimaestro/modified-hello-friend-ng hello-friend-ng
cd ..
curl -sLo hugo_0.64.0_Linux-64bit.deb https://github.com/gohugoio/hugo/releases/download/v0.64.0/hugo_0.64.0_Linux-64bit.deb
sudo dpkg -i hugo_0.64.0_Linux-64bit.deb
rm -rf hugo_0.64.0_Linux-64bit.deb
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
GH_PERSONAL_TOKEN="a0511260f9dbf646bd6823be977322cdba90782a"
# Build the project.
export BUILD_DIR=$(pwd)
cd ..
git clone https://github.com/ycodex/ycodex.github.io -b master public
cd public
export PUBLIC=$(pwd)
git checkout -b master
cd $BUILD_DIR
hugo -d ../public

# Go To Public folder
cd $PUBLIC
# Add changes to git.
git config --global user.email "karthiknaik120@gmail.com"
git config --global user.name "ycodex"
git add .
# Commit changes.
msg=" Push Built Site"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git remote rm origin
git remote add origin https://ycodex:${GH_PERSONAL_TOKEN}@github.com/ycodex/ycodex.github.io
git push origin master

# Come Back up to the Project Root
cd ..
