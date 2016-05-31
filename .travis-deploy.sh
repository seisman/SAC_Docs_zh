#!/bin/bash
#
# Deploy master branch only
#
#  TRAVIS_BRANCH:
#   - triggered by commit => the name of the branch currently being built
#   - triggered by a PR => the name of the branch targeted by the pull request
#  TRAVIS_PULL_REQUEST:
#   - is a pull request => pull request number
#   - not a pull request => false

if [ ${TRAVIS_BRANCH} = "master" -a ${TRAVIS_PULL_REQUEST} = 'false' ]; then
    echo "In master branch, deploying now..."
    git config user.name "Dongdong Tian"
    git config user.email "seisman.info@gmail.com"
    mkdir tmpdir && cp SAC_Docs.pdf tmpdir/
    ghp-import -b pdf tmpdir -m 'Update by travis automatically'
    git push "https://${GH_TOKEN}@${GH_REF}" pdf:pdf --force --quiet
else
    echo "Not in master branch"
fi
