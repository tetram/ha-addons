#!/usr/bin/env sh

echo "Agent DVR addon version 0.0.1"
echo "Agent DVR version $VERSION"

echo "Getting addon config"
addon_config=$(curl -sSL -H "Authorization: Bearer $SUPERVISOR_TOKEN" http://supervisor/addons/self/options/config)

h_tz=$(echo $addon_config | jq --raw-output '.data.timezone')
export TZ=$h_tz

export AGENTDVR_WEBUI_PORT=$(echo $addon_config | jq --raw-output '.data.webui_port')

exec "/AgentDVR/Agent.sh"
