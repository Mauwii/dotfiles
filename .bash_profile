# shellcheck shell=bash source=./.bashrc
# export LC_ALL=en_US.UTF-8

# Begin with a clear Path and set SHELL_ARCH env
eval "$(env -u PATH /usr/libexec/path_helper -s)"
SHELL_ARCH="$(arch)"
export SHELL_ARCH

# Initialize Arch-Specific Brew Environment if exists
if [[ "${SHELL_ARCH}" = "arm64" ]]; then
  if [[ -x "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  if [[ -x "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# add ESP-IDF Directory if it exists
if [[ -d "${HOME}/esp/esp-idf" ]]; then
  IDF_PATH="${HOME}/esp/esp-idf"
  ESPIDF="${IDF_PATH}"
  export IDF_PATH ESPIDF
fi

# add my own binaries to path
if [[ -d $HOME/scripting/bin ]]; then
  PATH="$HOME/scripting/bin:$PATH"
fi

# Add pyenv to front of path
if which pyenv > /dev/null; then
  PYENV_ROOT="$HOME/.pyenv.${SHELL_ARCH}"
  export PYENV_ROOT
  eval "$(pyenv init --path)"
fi

if [[ "${BASH-no}" != "no" ]]; then
	[[ -r "${HOME}/.bashrc" ]] && . "$HOME/.bashrc"
fi
