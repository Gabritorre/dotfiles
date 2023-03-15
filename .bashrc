# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

#PROMPT STYLE
#ANSI:
#PS1="\e[1;34m\u@\h:\e[0m \e[1;37m\W/\e[0m \$ "
#Bash:
PS1="\[\033[01;34m\]\u@\h:\[\033[0m\] \[\033[01;37m\]\W/\[\033[0m\] \$ "

# update window name
set-window-title() {
  echo -en "\033]0;$(pwd)\a"
}

if [[ "$PROMPT_COMMAND" ]]; then
  export PROMPT_COMMAND="$PROMPT_COMMAND;set-window-title"
else
  export PROMPT_COMMAND=set-window-title
fi

PATH="~/.ssh:${PATH}"
export PATH
