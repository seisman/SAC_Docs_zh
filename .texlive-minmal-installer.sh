#!/bin/bash
#
# Install minimal TeXLive 2015 for SAC_Docs_zh
#
REMOTE="http://ctan.mirrors.hoobly.com/systems/texlive/tlnet/"
TEXBIN=/usr/local/texlive/2015/bin/x86_64-linux
PACKAGES="environ trimspaces zhnumber fandol zapfding titlesec algorithm2e relsize latexmk ctex datetime2 tracklang minted ifplatform xstring enumitem tikz-3dplot siunitx symbol footmisc framed manfnt"

# install TeXLive
mkdir -p /tmp/install-texlive
cd /tmp/install-texlive/
curl -sSL $REMOTE/install-tl-unx.tar.gz | tar -xz -C ./ --strip-components=1

cat << EOF > texlive.profile
selected_scheme scheme-minimal
TEXMFHOME ~/.texmf
TEXMFCONFIG ~/.texlive/texmf-config
TEXMFVAR ~/.texlive/texmf-var
collection-basic 1
collection-genericrecommended 1
collection-latex 1
collection-latexextra 0
collection-latexrecommended 1
collection-xetex 1
collection-langchinese 0
option_autobackup 0
option_doc 0
option_src 0
EOF

sudo ./install-tl -profile texlive.profile -repository $REMOTE
sudo $TEXBIN/tlmgr install $PACKAGES

cd -
echo export PATH=$TEXBIN:'$PATH' > srcfile
