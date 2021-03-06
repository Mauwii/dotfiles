# shellcheck shell=bash source=./.bashrc

# Begin with a clear Path and set SHELL_ARCH env
eval "$(env -u PATH /usr/libexec/path_helper -s)"
SHELL_ARCH="$(arch)"
export SHELL_ARCH

# Initialize brew
if [[ -x "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# add ESP-IDF Directory if it exists
if [[ -d "${HOME}/esp/esp-idf" ]]; then
  IDF_PATH="${HOME}/esp/esp-idf"
  ESPIDF="${IDF_PATH}"
  export IDF_PATH ESPIDF
fi

# Initialize Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Bash completion
if [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]]; then
  . "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

# Dotnet Root
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# if [[ "${BASH-no}" != "no" ]]; then
#   [[ -r "${HOME}/.bashrc" ]] && . "$HOME/.bashrc"
# fi
