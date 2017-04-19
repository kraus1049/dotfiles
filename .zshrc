# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(cabal chruby copydir copyfile cp emoji emoji-clock gem git-extras git-flow git-flow-avh git-hubflow git-prompt git-remote-branch github gitignore gnu-utils go golang history histry-substring-search jruby man rbenv sudo tmux ubuntu vi-mode vim-interaction git rails ruby rake scala tmux-cssh tmux-inator vim-interaction web-search z zsh-navigation-tools zsh-reload)

# User configuration

export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=$PATH:~/$ANDROID_HOME/tools:
# export PATH=$PATH:~/$ANDROID_HOME/platform-tools
# export PATH=$PATH:~/$ANDROID_HOME/build-tools/23.0.2
export PATH=~/.local/bin:$PATH
export PATH=~/.local/share/umake/scala/scala-lang/bin:$PATH
export PATH=$PATH:~/.stack/programs/x86_64-linux/ghc-7.10.3/bin
export PATH=$PATH:~/.stack/snapshots/x86_64-linux/lts-5.14/7.10.3/bin
export PATH=$PATH:~/.rbenv/versions/2.3.0-dev/bin
# export MANPATH="/usr/local/man:$MANPATH"

export GOPATH=$HOME/program/go/third-party:$HOME/program/go/my-project
export PATH=$HOME/program/go/third-party/bin:$HOME/program/go/my-project/bin:$PATH

# export LIBGL_ALWAYS_INDIRECT=1
# export DISPLAY=:0.0

# export WINEPREFIX=~/.wine/win64/

export TERM=xterm-256color

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# added by travis gem
[ -f /home/toshi/.travis/travis.sh ] && source /home/toshi/.travis/travis.sh
