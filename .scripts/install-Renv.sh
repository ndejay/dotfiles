#!/usr/bin/env bash

INSTALL_TO="$HOME/.Renv"

echo "Installing to $INSTALL_TO"

if [ -d "$INSTALL_TO" ]; then
  echo "$INSTALL_TO already exists: skipping"
else
  git clone git://github.com/viking/Renv.git "$INSTALL_TO"
fi

if [ -d "$INSTALL_TO/plugins/R-build" ]; then
  echo "$INSTALL_TO/plugins/R-build already exists: skipping"
else
  git clone git://github.com/viking/R-build.git "$INSTALL_TO/plugins/R-build"
fi

cat <<EOT
Run the following:

  echo 'export PATH="\$HOME/.Renv/bin:\$PATH"' >> ~/.profile
  echo 'eval "\$(Renv init -)"' >> ~/.profile

  exec \$SHELL
EOT
