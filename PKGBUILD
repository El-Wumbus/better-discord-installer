# Maintainer: Aidan Neal <squidwardnose4507@gmail.com>
pkgname='better-discord-installer'
pkgver=r8.r11df999.
pkgrel=1
pkgdesc="Install better discord easily"
arch=("x86_64")
url="https://github.com/El-Wumbus/better-discord-installer"
license=("GPL3")
depends=("sh")
makedepends=("git")
source=("better-discord-installer::git+https://github.com/El-Wumbus/better-discord-installer.git#branch=master")
md5sums=("SKIP")

pkgver() {
	cd "better-discord-installer"
	printf "r%s.$s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "better-discord-installer"
	install -Dm755 src/better-discord-installer.sh "$pkgdir/usr/bin/better-discord-installer.sh"
	install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname"
}
