#!/bin/bash
alias clean="sudo bash -c 'apt-get clean; apt-get autoclean; apt-get autoremove -y'"
alias download='apt-get download'
alias df='df -h'
alias du1='du -hd 1'
alias ds='du -hs'
alias ga='git add'
alias gcl='git clone'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gdiscard='git reset --hard HEAD'
alias gl='git log --abbrev-commit --pretty=oneline'
alias gpm='git push origin master'
alias gpo='git push origin'
alias group='cut -d: -f1 /etc/group'
alias gs='git status'
alias h='history | grep'
alias hl='history | less'
alias l='less -R'
alias ls='ls --group-directories-first --color=always'
alias ldev='lsblk -f'
alias lsa='ls -la'
alias octave='octave --quiet'
alias psql='sudo -u postgres psql'
alias psu='ps -U root -u root -N | sed "s/^ *//" | tr -s " " "\t" | cut -f 1,4 | column'
alias purge='sudo apt-get --purge autoremove'
alias search='apt-cache search'
alias show='apt-cache show'
alias simi='apt-get -s install'
alias simp='apt-get -s --purge autoremove'
alias t='tree'
alias t1='tree -L 1'
alias tarc='tar cfz'
alias tarx='tar xf'
alias tarz='tar xfz'
alias uc='update && clean' #
alias uce='uc && exit' #
alias update="sudo bash -c 'apt-get update -y; apt-get upgrade -y; apt-get dist-upgrade -y'"

complete -F _apt_complete download
complete -F _apt_complete purge
complete -F _apt_complete install
complete -F _apt_complete uninstall
complete -F _apt_complete search
complete -F _apt_complete show
complete -F _apt_complete simi
complete -F _apt_complete simp

export EDITOR='vi'
export GOROOT=/opt/go
export HISTFILESIZE=
export HISTSIZE=
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_25
export PATH=${JAVA_HOME}:${PATH}
export PROMPT_COMMAND='history -a; history -n'

_apt_complete() {
  mapfile -t 'COMPREPLY' < <(apt-cache --no-generate 'pkgnames' "$2");
}

gc() {
  git commit -am "$@"
}

gp() {
  git push "$@" master
}

gr() {
  grep --color-always -R "$@" *
}

list_all() {
  arch=`dpkg --print-architecture`
  search="${1}: "
  cat '/var/log/apt/history.log' |
  egrep --color=never "$search" |
  sed -r "s/${search}//;s/,//g;s/ \([^)]+\)//g;s/:${arch}//g" |
  tr ' ' '\n'
}

installed() {
  dpkg --get-selections |
  grep -v 'deinstall' |
  cut -f 1 |
  grep --color=never "^${1}$"
}

installed1() {
  hash "$1" 2> /dev/null
  if [ "$?" -eq 0 ]
  then
    echo 'yes'
  else
    echo 'no'
  fi
}

version () {
  apt-cache show $@ |
  grep '^Version: ' |
  cut -d' ' -f2
}

#---------------------------------------------------------------------------

install() {
  mkdir -p ~/.packages
  as=
  force=
  set -- `getopt -l as: a:f $@`
  set -- `echo $@ | tr -d "'"`
  for arg
  do
    case "$arg"
    in
      -a|--as) as="$2"; shift; shift;;
      -f) force=-f; shift;;
      --) shift; break;;
    esac
  done
  for package
  do
    if [ -z "$as" ]
    then
      filename="$package"
    else
      filename="$as"
    fi
    log=~/".packages/${filename}"
    if [[ ! -f "$log" || -n "$as" ]]
    then
      packages=`apt-get -s install "$force" "$package" | grep '^Inst' | cut -d' ' -f2`
      if [ "$packages" != '' ]
      then
        echo "$packages" >> "$log"
      fi
    fi
  done
  sudo apt-get install "$force" $@
}

uninstall() {
  for package
  do
    log=~/".packages/${package}"
    if [ -f "$log" ]
    then
      packages=`cat "$log" | tr '\n' ' '`
      sudo apt-get purge $packages
    else
      sudo apt-get --purge autoremove "$package"
    fi
    rm -f "$log"
  done
}

unopts() {
  echo "`cat`" | sed -r 's/ --[^ ]+//g;s/ -[^ ]+//g'
}

list() {
  cat '/var/log/apt/history.log' |
  grep --color=never -v '\-o APT::Status-Fd=4 \-o APT::Keep-Fds::=5 \-o APT::Keep-Fds::=6' |
  egrep --color=never "Commandline: apt-get.* ${1}" |
  sed -r "s/Commandline: apt-get//;s/ ${1}//" |
  unopts |
  tr ' ' '\n' |
  sed '/^$/d'
}

hapt() {
  tmp=`mktemp -d`
  installed="${tmp}/installed"
  deleted="${tmp}/deleted"
  dpkg="${tmp}/dpkg"
  list 'install' > "$installed"
  list '(remove|purge|autoremove)' > "$deleted"
  dpkg --get-selections |
  grep -v 'deinstall' |
  cut -f 1 > "$dpkg"
  while read package
  do
    sed -i "0,/${package}/{//d;}" "$installed"
  done < "$deleted"
  while read package
  do
    if [ -z "`grep --color=never "^${package}$" "$dpkg"`" ]
    then
      sed -i "0,/${package}/{//d;}" "$installed"
    fi
  done < "$installed"
  cat "$installed"
  rm -r "$tmp"
}

r() {
  for arg
  do
    s=${#arg}
    arg2=${arg:0:s-1}
    if [ -L "$arg2" ]
    then
      if [[ "${arg: -1}" == '/' && -d "$arg" ]]
      then
        echo "Preserving symlinked directory '$arg'"
      fi
    else
      trash "${arg}"
    fi
  done
}

