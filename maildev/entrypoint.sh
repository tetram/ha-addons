#!/usr/bin/env sh

echo "Maildev addon version 0.0.1"
echo "Maildev version 2.1.0"

echo "Getting addon config"
addon_info=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/addons/self/info)

# Configure maildev based on addon info
h_outgoing_active=$(echo $addon_info | jq --raw-output '.data.options.outgoing.active')
if [ "$h_outgoing_active" = true ]; then
    echo 'Outgoing SMTP is active'
    h_mailde_outgoing_host=$(echo $addon_info | jq --raw-output '.data.options.outgoing.host')
    if [ -z $h_mailde_outgoing_host ]; then
    export MAILDEV_OUTGOING_HOST=$h_mailde_outgoing_host
    fi;
    h_mailde_outgoing_port=$(echo $addon_info | jq --raw-output '.data.options.outgoing.port')
    if [ -z $h_mailde_outgoing_port ]; then
    export MAILDEV_OUTGOING_PORT=$h_mailde_outgoing_port
    fi;
    h_mailde_outgoing_user=$(echo $addon_info | jq --raw-output '.data.options.outgoing.user')
    if [ -z $h_mailde_outgoing_user ]; then
    export MAILDEV_OUTGOING_USER=$h_mailde_outgoing_user
    fi;
    h_mailde_outgoing_pass=$(echo $addon_info | jq --raw-output '.data.options.outgoing.password')
    if [ -z $h_mailde_outgoing_pass ]; then
    export MAILDEV_OUTGOING_PASS=$h_mailde_outgoing_pass
    fi;
fi;

# Logs
h_log=$(echo $addon_info | jq --raw-output '.data.options.log')

case $h_log in
  silent)
    args="--silent"
    ;;
  verbose)
    args="--verbose"
    ;;
  *)
    args=""
    ;;
esac

exec bin/maildev args
