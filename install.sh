#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$DIR"
cp -r .gitconfig .inputrc .octaverc .terminfo .vimrc.after ~