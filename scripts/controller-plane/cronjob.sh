#!/bin/bash

# Regular Cron job tasks
CRON_JOB="0 2 1 * * /usr/local/bin/automation.sh >> /var/log/automation.log 2>&1"

# Check if the same task already exists
if ! (crontab -l 2>/dev/null | grep -qF "$CRON_JOB"); then
    # Add task to temporary file
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "Cron Task added successfully！"
else
    echo "Cron Task already exists, no need to add again。"
fi

# Create log file (if not exists)
touch /var/log/automation.log
chmod 644 /var/log/automation.log

# Configure log rotation
LOG_ROTATE_CONF="/etc/logrotate.d/controller_plane-cert-renew"
if [ ! -f "${LOG_ROTATE_CONF}" ]; then
    cat > "${LOG_ROTATE_CONF}" <<EOF
/var/log/automation.log {
    monthly
    rotate 12
    missingok
    notifempty
    compress
}
EOF
    echo "Log rotation configuration added"
fi

echo "Operation completed！"

