# autoload
autoload -U compinit promptinit colors
compinit        # autocompletion
promptinit      # advanced prompt support
colors          # prompt colors

# new line before prompt
precmd() { print "" }

# prompt
PROMPT="%{$fg[red]%}%M %{$fg_bold[white]%}>> %{$reset_color%}"
RPROMPT="%{$fg_bold[cyan]%}%~%{$reset_color%}"
zle_highlight=(default:fg=white)

# new line after command
preexec() { print "" }

# window title
case $TERM in
    (*xterm* | rxvt)
      function precmd {
          print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
      }
      function preexec {
          printf "\033]0;%s\a" "$1"
      }
    ;;
esac

# bindkeys
bindkey "^[[7~" beginning-of-line     # Home
bindkey "^[[8~" end-of-line           # End
bindkey "^[[3~" delete-char           # Del
bindkey "^[Oa"  beginning-of-line     # ctrl + Up
bindkey "^[Ob"  end-of-line           # ctrl + Down
bindkey "^[Oc"  forward-word          # ctrl + Right
bindkey "^[Od"  backward-word         # ctrl + Left
bindkey "^H"    backward-delete-word  # ctrl + Backspace
bindkey "^[[3^" delete-word           # ctrl + Del

# files
alias ls="ls --color=auto"
alias lsh="ls -d .[^.]*"
alias cp="cp -v -i"
alias rm="rm -v -i"
alias mv="mv -v -i"
alias mkdir="mkdir -v -p"
alias chmod="chmod -v"
alias chown="chown -v"
alias ln="ln -v"

# hdd space
alias df="df -h"
alias du="du -c -h"

# power
alias poweroff="sudo systemctl poweroff"
alias reboot="sudo systemctl reboot"

# cd
alias home="cd ~"
alias dl="cd ~/downloads/"
alias back="cd -"
alias up="cd .."

# programs
alias nano="nano -w"
alias nanoc="nano -Y conf"
alias grep="grep --color=auto"
