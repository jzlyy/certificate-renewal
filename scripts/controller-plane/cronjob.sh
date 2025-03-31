#!/bin/bash

# 定义要添加的 Cron 任务
CRON_JOB="0 2 1 * * /usr/local/bin/automation.sh >> /var/log/automation.log 2>&1"

# 检查是否已存在相同任务
if ! (crontab -l 2>/dev/null | grep -qF "$CRON_JOB"); then
    # 添加任务到临时文件
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "Cron 任务添加成功！"
else
    echo "Cron 任务已存在，无需重复添加。"
fi

# 创建日志文件（如果不存在）
touch /var/log/automation.log
chmod 644 /var/log/automation.log

# 配置日志轮转（可选）
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
    echo "日志轮转配置已添加。"
fi

echo "操作完成！"

