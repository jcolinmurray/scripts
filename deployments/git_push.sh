#!/bin/bash
# Deploy to via pushing to a remote git repository.
#
# Add the following environment variables to your project configuration and make
# sure the public SSH key from your projects General settings page is allowed to
# push to the remote repository as well.
# * REMOTE_REPOSITORY, e.g. "git@github.com:codeship/documentation.git"
# * REMOTE_BRANCH, e.g. "production"
#
# Include in your builds via
# \curl -sSL https://raw.githubusercontent.com/codeship/scripts/master/deployments/git_push.sh | bash -s
REMOTE_REPOSITORY=${REMOTE_REPOSITORY:?'You need to configure the REMOTE_REPOSITORY environment variable!'}
REMOTE_BRANCH=${REMOTE_BRANCH:?'You need to configure the REMOTE_BRANCH environment variable!'}

set -e

git config –global user.email “$GITMAIL”
git config –global user.name “$GITUSER”
# Clone the whole azure repository
cd
git clone $GITREPO azure
# Add the compiled app
cd azure
rm -R -f *
cp -R -f ~/clone/dist/* .
git add -A
git commit -m “Code shipped”
# push to azure
git push origin
