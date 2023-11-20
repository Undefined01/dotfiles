function __common_rc_get_shell() {
  ps -o comm= -p $$
}

function __common_rc_init_ls() {
  if command -v eza >/dev/null 2>&1; then
    alias ls='eza --color=auto'
    alias ll='eza --color=auto --long --all --color-scale all --extended'
  elif command -v exa >/dev/null 2>&1; then
    alias ls='exa --color=auto'
    alias ll='exa --color=auto --long --all --color-scale --extended'
  else
    alias ls='ls --color=auto'
    alias ll='ls --color=auto -alh'
  fi
}

function __common_rc_init_fzf() {
  local EXT="$(__common_rc_get_shell)"
  local FZF_PATH
  if command -v fzf-share >/dev/null 2>&1; then
    FZF_PATH="$(fzf-share)"
  elif command -v fzf >/dev/null 2>&1; then
    if [ -f "/usr/share/fzf/completion.$EXT" ]; then
      FZF_PATH=/usr/share/fzf
    elif [ -f "/usr/local/share/fzf/completion.$EXT" ]; then
      FZF_PATH=/usr/local/share/fzf
    elif [ -f "/usr/share/doc/fzf/examples/completion.$EXT" ]; then
      FZF_PATH=/usr/share/doc/fzf/examples/
    fi
  fi
  [ -f "$FZF_PATH/completion.$EXT" ] && source "$FZF_PATH/completion.$EXT"
  [ -f "$FZF_PATH/key-bindings.$EXT" ] && source "$FZF_PATH/key-bindings.$EXT"
}

function __common_rc_init_tldr() {
  if command -v tldr >/dev/null 2>&1; then
    export TLDR_LANGUAGE="en"
    # export TLDR_PAGES_SOURCE_LOCATION="https://cdn.jsdelivr.net/gh/tldr-pages/tldr/"
    # export TLDR_DOWNLOAD_CACHE_LOCATION="https://cdn.jsdelivr.net/gh/tldr-pages/tldr-pages.github.io/blob/main/assets/tldr.zip"
    export TLDR_PAGES_SOURCE_LOCATION="https://ghproxy.com/https://github.com/tldr-pages/tldr/blob/main/"
    export TLDR_DOWNLOAD_CACHE_LOCATION="https://ghproxy.com/https://github.com/tldr-pages/tldr-pages.github.io/blob/main/assets/tldr.zip"
    export TLDR_CACHE_ENABLED=1
    export TLDR_CACHE_MAX_AGE=8760
    export TLDR_AUTO_UPDATE_DISABLED=1
  fi
}

__common_rc_init_ls
__common_rc_init_fzf
__common_rc_init_tldr

command -v vi >/dev/null 2>&1 && export VISUAL='vi'
command -v vim >/dev/null 2>&1 && export VISUAL='vim'
command -v grep >/dev/null 2>&1 && alias grep='grep --color=auto'
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init --cmd cd $(__common_rc_get_shell))"
command -v bat >/dev/null 2>&1 && alias cat='bat'
command -v delta >/dev/null 2>&1 && alias diff='delta'


