#!/bin/bash
# /opt/rh/rh-php72/root/usr/bin/php $APP_DATA/admin/cli/maintenance.php --enable

# Activities: Custom certificate
if [ -d "$APP_DATA/mod/customcert" ]; then rm -Rf $APP_DATA/mod/customcert; fi
wget https://moodle.org/plugins/download.php/18626/mod_customcert_moodle36_2018120301.zip
unzip mod_customcert_moodle36_2018120301.zip
rm mod_customcert_moodle36_2018120301.zip
mv customcert $APP_DATA/mod/

# Blocks: Completion Progress
if [ -d "$APP_DATA/blocks/completion_progress" ]; then rm -Rf $APP_DATA/blocks/completion_progress; fi
wget https://moodle.org/plugins/download.php/18188/block_completion_progress_moodle36_2018111000.zip
unzip block_completion_progress_moodle36_2018111000.zip
rm block_completion_progress_moodle36_2018111000.zip
mv completion_progress $APP_DATA/blocks/

# Blocks: Configurable Reports
if [ -d "$APP_DATA/blocks/configurable_reports" ]; then rm -Rf $APP_DATA/blocks/configurable_reports; fi
wget https://moodle.org/plugins/download.php/18988/block_configurable_reports_moodle36_2019021500.zip
unzip block_configurable_reports_moodle36_2019021500.zip
rm block_configurable_reports_moodle36_2019021500.zip
mv configurable_reports $APP_DATA/blocks/

# Filters: Multi-Language Content (v2)
if [ -d "$APP_DATA/filter/multilang2" ]; then rm -Rf $APP_DATA/filter/multilang2; fi
wget https://moodle.org/plugins/download.php/17314/filter_multilang2_moodle36_2018070401.zip
unzip filter_multilang2_moodle36_2018070401.zip
rm filter_multilang2_moodle36_2018070401.zip
mv multilang2 $APP_DATA/filter/

# Local: Kopere Dashboard
if [ -d "$APP_DATA/local/kopere_dashboard" ]; then rm -Rf $APP_DATA/local/kopere_dashboard; fi
wget https://moodle.org/plugins/download.php/19201/local_kopere_dashboard_moodle36_2019031900.zip
unzip local_kopere_dashboard_moodle36_2019031900.zip
rm local_kopere_dashboard_moodle36_2019031900.zip
mv EduardoKrausME-moodle-local-kopere_dashboard-7e28608 $APP_DATA/local/kopere_dashboard

# This one seems to break Moodle 3.6
# wget https://github.com/wet-boew/wet-boew-moodle/archive/master.zip
# unzip master.zip -d $APP_DATA/theme
# rm master.zip

# Upgrade the Moodle database non-interactively.
# cd $APP_DATA
# /opt/rh/rh-php72/root/usr/bin/php admin/cli/upgrade.php --non-interactive
# /opt/rh/rh-php72/root/usr/bin/php admin/cli/purge_caches.php

# Remove PHP Composer folders
# if [ -d "$APP_DATA/vender" ]; then rm -Rf $APP_DATA/vender; fi
# if [ -d "$APP_DATA/node_modules" ]; then rm -Rf $APP_DATA/node_modules; fi

# Set permissions for config.php
# /bin/chmod g-w $APP_DATA/config.php

# Disable Moodle maintenance mode.
# /opt/rh/rh-php72/root/usr/bin/php admin/cli/maintenance.php --disable

# Schedule cron to run every 1 minute. (cron service not available in container)
# (crontab -l && echo "* * * * * /opt/rh/rh-php72/root/usr/bin/php /opt/app-root/src/admin/cli/cron.php") | crontab -
