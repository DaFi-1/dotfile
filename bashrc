bind 'set completion-ignore-case on'
# Lista as opções automaticamente sem precisar de Tab duplo
bind 'set show-all-if-ambiguous on'
# Completar arquivos adicionando / para diretórios
bind 'set mark-symlinked-directories on'
# Ativa menu-complete no Tab
bind '"\t": menu-complete'
# Se quiser navegar para trás (Shift+Tab)
bind '"\e[Z": menu-complete-backward'

export EDITOR=nvim
export VISUAL=nvim
export RANGER_EDITOR=nvim
export TERM=xterm-256color
#HIST
HISTFILE=~/.bash_history
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend
PROMPT_COMMAND='history -a; history -n'
#export HISTCONTROL=ignoredups:erasedups
#export HISTTIMEFORMAT="%F %T "
alias ls="lsd -ali --group-dirs first"
alias cat="batcat"
alias n="$HOME/dotfile/nnn/nnn -H -e -d"
alias mudarteclas='sudo nvim /usr/share/X11/xkb/symbols/pc'
alias python='python3'
alias xiniti3='xinit /usr/bin/i3 -- :0'
alias xinitidwm="xinit $HOME/dotfile/dwm-6.6/dwm -- :0"
#######################
# THEME LINE BASH PS1 #
#######################
git_branch() {
    local branch
    branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "  ($branch)"
    else
        echo "  (None)"
    fi
}

python_venv() {
    if [ -n "$VIRTUAL_ENV" ]; then
        # Pega só o nome do ambiente
        local venv_name
        venv_name=$(basename "$VIRTUAL_ENV")
        echo " ($venv_name)"
    else
        echo " (None)"
    fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

if [ "$FROM_NNN" = "1" ]; then
    PS1="\[\e[32m\](nnn)\[\e[0m\] \$(python_venv) \$(git_branch) - "
else
    #PS1=" - "
    PS1="\$(python_venv) \$(git_branch) - "
fi
