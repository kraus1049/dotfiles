: "User configuration" && {
    export LANG=ja_JP.UTF-8
    export TERM=xterm-256color
}

: "Preferred editor for local and remote sessions" && {
    if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
    else
        export EDITOR='vim'
    fi
}

: "if running bash" && {
    if [ -n "$BASH_VERSION" ]; then
        # include .bashrc if it exists
        if [ -f "$HOME/.bashrc" ]; then
            "$HOME/.bashrc"
        fi
    fi
}

: "WSL の場合" && {
    if [[ `uname -a` =~ Linux && `uname -a` =~ Microsoft ]]; then
        : "GUI表示用" && {
            export DISPLAY=localhost:0.0
        }

        export LC_MESSAGES=ja_JP.UTF-8
        export LC_IDENTIFICATION=ja_JP.UTF-8
        export LC_COLLATE=ja_JP.UTF-8
        export LC_MEASUREMENT=ja_JP.UTF-8
        export LC_CTYPE=ja_JP.UTF-8
        export LC_TIME=ja_JP.UTF-8
        export LC_NAME=ja_JP.UTF-8

        : "uimを使う" && {
            export XIM=uim
            export XMODIFIERS=@im=uim
            export UIM_CANDWIN_PROG=uim-candwin-gtk
            export GTK_IM_MODULE=uim
            export QT_IM_MODULE=uim
        }
        
        : "fcitxを使う" || {
            IM=fcitx
            export XMODIFIERS="@im=$IM"
            export GTK_IM_MODULE=$IM
            export QT_IM_MODULE=$IM
        }
    fi
}

: "環境変数設定" || {
    export GOPATH=$HOME/src/
    if [[ `uname -a` =~ Linux && `uname -a` =~ ARCH ]]; then
        export GOROOT=usr/lib/go
    else
        export GOROOT=$HOME/.local/share/umake/go/go-lang
    fi
    export SCALA_HOME=$HOME/.local/share/umake/scala/scala-lang
    export PYENV_ROOT=$HOME/.pyenv
    export XDG_CONFIG_HOME=$HOME/.config
    export MIX_HOME=$HOME/.mix
}

: "pathを設定" || {
    # safe_path
    #優先度高いものほど↑へ
    path=(
        $MIX_HOME(N-/)
        $HOME/.local/bin(N-/)
        /usr/local/heroku/bin(N-/)
        $HOME/.rbenv/versions/2.3.0-dev/bin(N-/)
        $HOME/.rbenv/bin(N-/)
        $scala/bin(N-/)
        $HOME/.cargo/bin(N-/)
        $HOME/.local/share/umake/go/go-lang/bin(N-/)
        $GOPATH/bin(N-/)
        /usr/local/bin(N-/)
        $HOME/bin(N-/)
        $PYENV_ROOT/bin(N-/)
        $HOME/.local/share/tor-browser_ja/Browser/(N-/)
        $path
    )
}

: "rustの設定" || {
    if [ -x "`which rustc`" ]; then
        export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
        fpath=(
            $HOME/.zfunc
            $fpath
        )
    fi
}

: "env系列の初期化" || {
    if [ -d "$HOME/.rbenv/bin" ]; then
        eval "$(rbenv init -)"
    fi

    if [ -d "$HOME/.pyenv/bin" ]; then
        eval "$(pyenv init -)"
    fi
}

: "added by travis gem" || {
    [ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
}

: "xmodmapの設定" || {
    xmodmap $HOME/.Xmodmap
}

: "nodeの設定" || {
    export NODE_PATH=$(npm root -g)
}
