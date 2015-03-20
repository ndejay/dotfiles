#!/usr/bin/env bash

INSTALL_TO="$HOME/.rbenv"

echo "Installing to $INSTALL_TO"

if [ -d "$INSTALL_TO" ]; then
  echo "$INSTALL_TO already exists: skipping"
else
  git clone git://github.com/sstephenson/rbenv.git "$INSTALL_TO"
fi

if [ -d "$INSTALL_TO/plugins/ruby-build" ]; then
  echo "$INSTALL_TO/plugins/ruby-build already exists: skipping"
else
  git clone git://github.com/sstephenson/ruby-build.git "$INSTALL_TO/plugins/ruby-build"
fi

cat <<EOT
Run the following:

  echo 'export PATH="\$HOME/.rbenv/bin:\$PATH"' >> ~/.profile
  echo 'eval "\$(rbenv init -)"' >> ~/.profile

  exec \$SHELL
EOT
