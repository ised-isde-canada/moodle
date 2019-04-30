#!/bin/bash
# Set Moodle into Maintenance Mode
/opt/rh/rh-php72/root/usr/bin/php $APP_DATA/admin/cli/maintenance.php --enable

# Upgrade the Moodle database non-interactively.
cd $APP_DATA
/opt/rh/rh-php72/root/usr/bin/php admin/cli/upgrade.php --non-interactive
/opt/rh/rh-php72/root/usr/bin/php admin/cli/purge_caches.php

# Set permissions for config.php - chmod and chown don't work in container)
# /bin/chmod g-w $APP_DATA/config.php

# Disable Moodle maintenance mode.
/opt/rh/rh-php72/root/usr/bin/php admin/cli/maintenance.php --disable

# Schedule cron to run every 1 minute. (cron service not available in container)
# (crontab -l && echo "* * * * * /opt/rh/rh-php72/root/usr/bin/php /opt/app-root/src/admin/cli/cron.php") | crontab -
