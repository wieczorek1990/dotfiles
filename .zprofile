# Brew
if [ -f "/opt/homebrew/bin/brew" ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Fish
PATH="/Applications/fish.app/Contents/Resources/base/usr/local/bin:${PATH}"
# Python
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
# Ruby
PATH="/opt/homebrew/opt/ruby/bin:${PATH}"
# Path export
export PATH

# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH
