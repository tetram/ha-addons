#!/usr/bin/env sh
#set -e

echo "Maildev addon version 0.0.1"
echo "Maildev version 2.1.0"

# Configure maildev based on addon config file
## Web port
h_mailde_web_port=$(jq --raw-output '.web_port // empty' $CONFIG_PATH)
if [ -z $h_mailde_web_port ]; then
  export MAILDEV_WEB_PORT=$h_mailde_web_port
fi;

## SMTP port
## Relay
## Allowed relay adresses

exec bin/maildev
