

export PS1="\[\e[1;33m\]\w>\[\e[00m\] "
alias ls="ls --color"
alias ll="ls -l"
alias loadfx="module load TCSuite/fx/fx"
alias loadpc="module load TCSuite/pc/pc ; export FORT90L=-Wl,-T"

#- GrADS https://intrasv.mri-jma.go.jp/redmine/issues/124
alias loadgrads="module load GrADS/front/2.1.a3"
export GASCRP="./libgs ./mylib"

#- Git https://intrasv.mri-jma.go.jp/redmine/issues/48
export PREFIX=/usr/local/Git/front/2.2.0
export PATH=$PREFIX/bin:$PREFIX/libexec/git-core:$PATH
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
export GIT_EXEC_PATH=$PREFIX/libexec/git-core
export GIT_TEMPLATE_DIR=$PREFIX/share/git-core/templates
export MANPATH=/usr/local/Git/front/2.2.0/share/man:$MANPATH
