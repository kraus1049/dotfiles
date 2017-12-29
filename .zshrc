# See https://github.com/Microsoft/BashOnWindows/issues/1887
unsetopt BG_NICE

: "zplug" && {
    source ~/.zplug/init.zsh

    : "プラグイン" && {
        zplug 'zplug/zplug', hook-build:'zplug --self-manage'

        : "タイプ補完" && {
            zplug "zsh-users/zsh-autosuggestions"
            zplug "zsh-users/zsh-completions"
            zplug "chrissicool/zsh-256color"
        }

        zplug "mollifier/anyframe"

        zplug "zsh-users/zsh-syntax-highlighting", defer:2
        zplug "zsh-users/zsh-history-substring-search"

        zplug "b4b4r07/enhancd", use:init.sh

        : "prompt" && {
            zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
            zplug "mafredri/zsh-async"
        }
    }

    : "インストール" && {
        if ! zplug check --verbose; then
            printf 'Install? [y/N]: '
            if read -q; then
                echo; zplug install
            fi
        fi
    }

    : "ロード" && {
        zplug load
    }
}

: "一般的な設定" && {
    setopt nobeep # ビープを鳴らさない
    setopt no_tify # バックグラウンドジョブが終了したらすぐに知らせる。
    setopt auto_menu # タブによるファイルの順番切り替え

    # cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
    setopt auto_pushd 
    # pushdしたときディレクトリがすでにスタックに含まれていれば追加しない
    setopt pushd_ignore_dups

    setopt auto_cd # ディレクトリ名を入力するだけでcdできるようにする
    cdpath=(.. ~ ~/src)

    setopt interactive_comments # コマンドラインでも # 以降をコメントと見なす
    setopt extended_glob # 拡張globを有効にする

    # Ctrl+sのロック, Ctrl+qのロック解除を無効にする
    setopt no_flow_control

    # 日本語ファイル名を表示可能にする
    setopt print_eight_bit

    # 日本語ファイル名を表示可能にする
    setopt print_eight_bit
    # 単語の一部として扱われる文字のセットを指定する
    # ここではデフォルトのセットから / を抜いたものとする
    # こうするとCtrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
    WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

    # cdの後にlsを実行
    chpwd() { ls --color=auto}
}


: "補完" && {
    autoload -U compinit && compinit # 補完機能の強化
    if [ -e /usr/local/share/zsh-completions ]; then
        fpath=(/usr/local/share/zsh-completions $fpath)
    fi

    # 入力しているコマンド名が間違っている場合にもしかして：を出す。
    setopt correct 

    # 補完後、メニュー選択モードになり左右キーで移動が出来る
    zstyle ':completion:*:default' menu select=2

    # 補完で大文字にもマッチ
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

    # sudo の後ろでコマンド名を補完する
    zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
}

: "color" && {
    autoload -Uz colors && colors
    zstyle ':completion:*' list-colors "${LS_COLORS}"
    export CLICOLOR=1
}

: "ヒストリ関連の設定" && {
  HISTFILE=$HOME/.zsh_history # ヒストリファイル名
  HISTSIZE=10000 # メモリに保存される履歴の件数
  SAVEHIST=10000 # 履歴ファイルに保存される履歴の件数
  setopt hist_ignore_dups # 直前と同じコマンドをヒストリに追加しない
  setopt hist_ignore_all_dups # 重複するコマンドは古い方を削除する
  setopt share_history # 異なるウィンドウでコマンドヒストリを共有する
  setopt hist_no_store # historyコマンドは履歴に登録しない
  setopt hist_reduce_blanks # 余分な空白は詰めて記録
  setopt hist_verify # `!!`を実行したときにいきなり実行せずコマンドを見せる
}

: "cdr" && {
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
}

: "peco" && {
    function peco-select-history() {
        # historyを番号なし、逆順、最初から表示。
        # 順番を保持して重複を削除。
        # カーソルの左側の文字列をクエリにしてpecoを起動
        # \nを改行に変換
        BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
        CURSOR=$#BUFFER             # カーソルを文末に移動
        zle -R -c                   # refresh
    }

    zle -N peco-select-history

    function peco-buffer() {
        BUFFER=$(eval ${BUFFER} | peco)
        CURSOR=0
    }

    zle -N peco-buffer

    function peco-src () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
    }
    zle -N peco-src
}

: "キーバインディング" && {
  : "Ctrl-Yで上のディレクトリに移動できる" && {
    function cd-up { zle push-line && LBUFFER='builtin cd ..' && zle accept-line }
    zle -N cd-up
    bindkey "^Y" cd-up
  }

  : "Ctrl-[で直前コマンドの単語を挿入できる" && {
    autoload -Uz smart-insert-last-word

    # [a-zA-Z], /, \ のうち少なくとも1文字を含む長さ2以上の単語
    zstyle :insert-last-word match '*([[:alpha:]/\\]?|?[[:alpha:]/\\])*' 
    zle -N insert-last-word smart-insert-last-word
    bindkey '^[' insert-last-word
  }

  : "履歴をpeco" && {
    bindkey '^R' anyframe-widget-put-history
  }

  : "<M-p>でコマンドを実行してpeco" && {
    bindkey "^[p" peco-buffer
  }

  : "ghqをpeco" && {
    bindkey '^G' peco-src
  }
}


: "エイリアス" && {
    alias ls='ls --color=auto'
    alias cdr=anyframe-widget-cdr
}


: ".profileを読む" && {
    source $HOME/.profile
}

: ".local_profileがあれば読む" && {
    [ -f $HOME/.local_profile ] && source $HOME/.local_profile
}
