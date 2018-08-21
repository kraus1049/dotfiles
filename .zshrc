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

        zplug "momo-lab/zsh-abbrev-alias"

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
    cdpath=(
        ..
        $HOME(N-/)
        $HOME/src(N-/)
        $cdpath
        )

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

    # # cdの後にlsを実行
    # chpwd() { ls --color=auto}

    : "cd先のディレクトリのファイル一覧を表示する" && {
    [ -z "$ENHANCD_ROOT" ] && function chpwd { ls -BL } # enhancdがない場合
    [ -z "$ENHANCD_ROOT" ] || export ENHANCD_HOOK_AFTER_CD="ls -BL" # enhancdがあるときはそのHook機構を使う
    }

    # matchしなかったとき中断しない
    setopt no_no_match
}


: "補完" && {
    autoload -U compinit && compinit # 補完機能の強化
    if [ -e /usr/local/share/zsh-completions ]; then
        fpath=(/usr/local/share/zsh-completions $fpath)
    fi

    # 入力しているコマンド名が間違っている場合にもしかして：を出す。
    setopt correct 

    ### 補完方法毎にグループ化する。
    zstyle ':completion:*' format '%B%F{blue}%d%f%b'
    zstyle ':completion:*' group-name ''

    ### 補完候補に色を付ける。
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

    zstyle ':completion:*' keep-prefix
    zstyle ':completion:*' recent-dirs-insert both

    # 補完後、メニュー選択モードになり左右キーで移動が出来る
    zstyle ':completion:*:default' menu select=2

    ### 補完候補がなければより曖昧に候補を探す。
    ### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
    ### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

    ### 補完候補
    ### _oldlist 前回の補完結果を再利用する。
    ### _complete: 補完する。
    ### _match: globを展開しないで候補の一覧から補完する。
    ### _history: ヒストリのコマンドも補完候補とする。
    ### _ignored: 補完候補にださないと指定したものも補完候補とする。
    ### _approximate: 似ている補完候補も補完候補とする。
    ### _prefix: カーソル以降を無視してカーソル位置までで補完する。
    zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix

    ## 補完候補をキャッシュする。
    zstyle ':completion:*' use-cache yes
    zstyle ':completion:*' cache-path ~/.zsh/cache

    # sudo の後ろでコマンド名を補完する
    zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

    : "sshコマンド補完を~/.ssh/configから行う" && {
    function _ssh { compadd `fgrep 'Host ' ~/.ssh/config.* | grep -v '*' |  awk '{print $2}' | sort` }

    setopt magic_equal_subst  # コマンドライン引数の --prefix=/usr とか=以降でも補完
    setopt complete_in_word  # カーソル位置で補完する。
    setopt auto_list  # 補完候補が複数ある時に、一覧表示
}
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

    function peco-file() {
        if git rev-parse 2> /dev/null; then
            source_files=$(git ls-files)
        else
            source_files=$(find . -type f)
        fi
        selected_files=$(echo $source_files | peco --prompt "[find file]")

        BUFFER="${BUFFER} $(echo $selected_files | tr '\n' ' ')"
        CURSOR=$#BUFFER
        zle redisplay
    }
    zle -N peco-file

    function peco-folder() {
        selected_dirs=$(find -L ./ -type d)
        selected_dirs=$(echo $source_dirs | peco --prompt "[find directory]")

        BUFFER="${BUFFER} $(echo $selected_dirs | tr '\n' ' ')"
        CURSOR=$#BUFFER
        zle redisplay
    }
    zle -N peco-folder

    function peco-git-changed() {
        git status --short | peco | awk '{print $2}'
    }
    zle -N peco-git-changed

    function peco-git-hash() {
        git log --oneline --branches | peco | awk '{print $1}'
    }
    zle -N peco-git-changed
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

  : "Ctrl-fでfileを再帰的にpeco" && {
    bindkey '^F' peco-file
  }

  : "<M-D>でdirectoryを再帰的にpeco" && {
    bindkey '^[d' peco-folder
  }

  # : "Ctrl-qでfind" && {
  #   bindkey '^q' peco-find-file
  # }
}


: "エイリアス" && {
    alias ls='ls --color=auto'
    alias cdr=anyframe-widget-cdr
    alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
    alias -g H='$(peco-git-hash)'
    alias -g F='$(peco-git-changed)'
    # alias -g D='$(peco-directory)'
    alias -g Djupyterlab='docker-compose -f $HOME/src/containers/jupyterlab/docker-compose.yml up --build'
    alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc'
}

: "略語展開(iab)" && {
  abbrev-alias tree="tree -NC" # N: 文字化け対策, C:色をつける
  abbrev-alias gpl="git pull"
  abbrev-alias gps="git push"
  abbrev-alias gco="git commit -av"
  abbrev-alias ga="git add -A"
  #abbrev-alias gs="git status -s"
  abbrev-alias dp="docker ps"
  abbrev-alias di="docker images"
  abbrev-alias edi="eval \$(dinghy env)"
  abbrev-alias -g a1="awk '{print \$1}'"
  abbrev-alias -g a2="awk '{print \$2}'"
  abbrev-alias -g a3="awk '{print \$3}'"
  abbrev-alias -g a4="awk '{print \$4}'"
  abbrev-alias -g a5="awk '{print \$5}'"
  abbrev-alias -g a6="awk '{print \$6}'"
  abbrev-alias -g a7="awk '{print \$7}'"
  abbrev-alias -g a8="awk '{print \$8}'"
  abbrev-alias -g a9="awk '{print \$9}'"
  abbrev-alias -g a10="awk '{print \$10}'"
  abbrev-alias -g a11="awk '{print \$11}'"
  abbrev-alias -g a12="awk '{print \$12}'"
  abbrev-alias -g a13="awk '{print \$13}'"
  abbrev-alias -g a14="awk '{print \$14}'"
  abbrev-alias -g a15="awk '{print \$15}'"
  abbrev-alias -g a16="awk '{print \$16}'"
  abbrev-alias -g and="|" # パイプが遠いのでandを割り当てる。例えば`tail -f ./log | grep error`を`tail -f ./log and grep error`と書くことができる
}

: ".profileを読む" && {
    source $HOME/.profile
}

: ".local_profileがあれば読む" && {
    [ -f $HOME/.local_profile ] && source $HOME/.local_profile
}

: "enhancdの設定" && {
    export ENHANCD_DOT_SHOW_FULLPATH=0
}
