#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="uwufetch"
pkgname="${name}"
version="1.4"
url="https://github.com/TheDarkBug/${name}/archive/refs/tags/${version}.zip"
description="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
build_depends="gcc pandoc"
optdepends=("viu: image preview"
"lshw: hardware info")
gives="${name}"
breaks="${name}-git ${name}-bin"
hash="062de9ec1af10ce5bccc5cd99ab72511883076c96d6ebb6f21647fb3486ca391"

prepare() {
  sudo mkdir -p /usr/src/pacstall/"${name}"/usr/bin
  sudo mkdir -p /usr/src/pacstall/"${name}"/usr/lib
  sudo mkdir -p /usr/src/pacstall/"${name}"/usr/share/man/man1
}

build() {
  make -j"$(nproc)" build DESTDIR=/usr/src/pacstall/"${name}"
  make -j"$(nproc)" man DESTDIR=/usr/src/pacstall/"${name}"
}

install() {
  sudo make install DESTDIR=/usr/src/pacstall/"${name}"
}
