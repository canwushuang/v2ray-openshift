#!/bin/sh
# V2Ray new configuration
cat <<-EOF > /etc/vty/config.json
$CONFIG_JSON
EOF
# Run VTy
/usr/bin/vty/v2ray -config=/etc/vty/config.json
