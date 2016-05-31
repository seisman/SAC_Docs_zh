#!/bin/bash
#
# Deploy PDF file to pdf branch
#
git config user.name "Dongdong Tian"
git config user.email "seisman.info@gmail.com"
mkdir tmpdir && cp SAC_Docs.pdf tmpdir/
ghp-import -b pdf tmpdir -m 'Update by travis automatically'
git push "https://${GH_TOKEN}@${GH_REF}" pdf:pdf --force --quiet
