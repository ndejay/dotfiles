#!/usr/bin/env bash

INSTALL_TO="$HOME/.pyenv"

echo "Installing to $INSTALL_TO"

if [ -d "$INSTALL_TO" ]; then
  echo "$INSTALL_TO already exists: skipping"
else
  git clone git@github.com:yyuu/pyenv.git "$INSTALL_TO"
fi

cat <<EOT
Run the following:

  echo 'export PYENV_ROOT="\$HOME/.pyenv"' >> ~/.profile
  echo 'export PATH="\$HOME/.pyenv/bin:\$PATH"' >> ~/.profile
  echo 'eval "\$(pyenv init -)"' >> ~/.profile

  exec \$SHELL
EOT
