# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

function safe_path() {
	local local="$HOME/.local"
	local umake="$local/share/umake"
	local scala="$umake/scala/scala-lang"
	# local rust="$umake/rust/rust-lang"
	# local go="$umake/go/go-lang"

	export GOPATH=$HOME/program/go/third-party:$HOME/program/go/my-project
	export GOROOT=$go
	export SCALA_HOME=$scala
	export PYENV_ROOT="$HOME/.pyenv"
	# export LD_LIBRARY_PATH=$rust/rustc/lib

	#優先度高いものほど下へ
	path_cands=( /usr/local/heroku/bin
		    "$HOME/.rbenv/versions/2.3.0-dev/bin"
		    "$HOME/.rbenv/bin"
		    "$scala/bin"
		    # "$rust/cargo/bin"
		    # "$rust/rustc/bin"
		    "$HOME/.cargo/bin"
		    "$go/bin"
		    "$HOME/program/go/my-project/bin"
		    "$HOME/program/go/third-party/bin"
		     /usr/local/bin
		    "$local/bin"
		    "$HOME/bin"
		    "$PYENV_ROOT/bin"
		     )
	for p in ${path_cands[@]}
	do
		if [ -d $p ]; then
			export PATH=$p:$PATH
		fi
	done

	if [ -d "$HOME/.rbenv/bin" ]; then
		eval "$(rbenv init -)"
	fi

	if [ -d "$HOME/.pyenv/bin" ]; then
		eval "$(pyenv init -)"
	fi
}

safe_path
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"


export LC_MESSAGES=ja_JP.UTF-8
export LC_IDENTIFICATION=ja_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_NAME=ja_JP.UTF-8

export XIM=uim
export XMODIFIERS=@im=uim
#export UIM_CANDWIN_PROG=uim-candwin-gtk
export UIM_CANDWIN_PROG=uim-candwin-gtk
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim

# if [ $SHLVL -eq 1 ]; then
# 	uim-xim &
# fi
