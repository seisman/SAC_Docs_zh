DEST=/usr/share/fonts/opentype
REPO=https://github.com/adobe-fonts/source-code-pro.git
git clone --depth 1 --branch release ${REPO} ${DEST}
fc-cache -f -v
