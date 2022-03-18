# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Custom Variables
EDITOR=vim

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/zshhistory
setopt appendhistory

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Insall plugins via package manager
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
alias clearRamCache="sudo sh -c 'echo 3 >  /proc/sys/vm/drop_caches'"
alias premid-start="~/./Documents/PreMiD-Portable.AppImage"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias gn="systemctl suspend"
alias restartplasma="killall plasmashell && plasmashell"
alias tlauncher="java -jar ~/Downloads/TLauncher-2.83/TLauncher-2.83.jar"
alias cls='clear'
alias ls='exa --color auto'
alias l='exa --color auto'
alias ll='exa -la --color auto'
alias la='exa -la --color auto'
alias mirror-update="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mpv='mpv --hwdec'

# kitty blur in kde plasma
if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|kitty$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi

# gui timer
timer() {
  local N=$1; shift

  (sleep $N && zenity --info --title="Time's Up" --text="${*:-BING}") &
  echo "timer set for $N"
}


eval "$(starship init zsh)"
