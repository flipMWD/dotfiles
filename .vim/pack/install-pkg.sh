#!/bin/sh
# ~/.vim/pack/install-pkg.sh, :scriptnames, :helptags ALL
# Author: Cam [https://vi.stackexchange.com/questions/9522/]

create_group() {
	package_group="$1"
	path="$HOME/.vim/pack/$package_group/start"
	mkdir -p "$path"
	cd "$path" || exit
}

package() {
	repo_url="$1"
	repo_name="$(basename "$repo_url" .git)"
	if [ -d "$repo_name" ]; then
		cd "$repo_name" || exit
		result=$(git pull --force)
		echo "$repo_name: $result"
	else
		echo "$repo_name: Installing..."
		git clone -q "$repo_url"
	fi
}

(
create_group utility
package https://github.com/junegunn/fzf.vim &
wait
) &

wait
