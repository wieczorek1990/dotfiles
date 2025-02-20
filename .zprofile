# Brew
if [ -f "/opt/homebrew/bin/brew" ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    if [ -f "/usr/local/bin/brew" ]
    then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Binaries
PATH="/Applications/fish-4.0b1.app/Contents/Resources/base/usr/local/bin:${PATH}"
export PATH
