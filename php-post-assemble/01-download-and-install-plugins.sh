#!/bin/bash
/opt/rh/rh-php72/root/usr/bin/php $APP_DATA/admin/cli/maintenance.php --enable

# Activities: Custom certificate
wget https://moodle.org/plugins/download.php/18188/https://moodle.org/plugins/download.php/18626/mod_customcert_moodle36_2018120301.zip
unzip https://moodle.org/plugins/download.php/18626/mod_customcert_moodle36_2018120301.zip $APP_DATA/mod
mv $APP_DATA/mod/mod_customcert_moodle36_2018120301 $APP_DATA/mod/customcert
rm https://moodle.org/plugins/download.php/18626/mod_customcert_moodle36_2018120301.zip

# Blocks: Completion Progress
wget https://moodle.org/plugins/download.php/18188/block_completion_progress_moodle36_2018111000.zip
unzip block_completion_progress_moodle36_2018111000.zip $APP_DATA/blocks
mv $APP_DATA/blocks/block_completion_progress_moodle36_2018111000 $APP_DATA/blocks/completion_progress
rm block_completion_progress_moodle36_2018111000.zip

# Blocks: Configurable Reports
wget https://moodle.org/plugins/download.php/18988/block_configurable_reports_moodle36_2019021500.zip
unzip https://moodle.org/plugins/download.php/18988/block_configurable_reports_moodle36_2019021500.zip $APP_DATA/blocks
mv $APP_DATA/blocks/https://moodle.org/plugins/download.php/18988/block_configurable_reports_moodle36_2019021500 $APP_DATA/blocks/configurable_reports
rm https://moodle.org/plugins/download.php/18988/block_configurable_reports_moodle36_2019021500.zip

# Filters: Multi-Language Content (v2)
wget https://moodle.org/plugins/download.php/17314/filter_multilang2_moodle36_2018070401.zip
unzip filter_multilang2_moodle36_2018070401.zip $APP_DATA/filter
mv $APP_DATA/filter/filter_multilang2_moodle36_2018070401 $APP_DATA/filter/multilang2
rm filter_multilang2_moodle36_2018070401.zip

# Local: Kopere Dashboard
wget https://moodle.org/plugins/download.php/19201/local_kopere_dashboard_moodle36_2019031900.zip
unzip local_kopere_dashboard_moodle36_2019031900.zip -d $APP_DATA/local
mv $APP_DATA/local/EduardoKrausME-moodle-local-kopere_dashboard-7e28608 $APP_DATA/local/kopere_dashboard
rm local_kopere_dashboard_moodle36_2019031900.zip

# This one seems to break Moodle 3.6
# wget https://github.com/wet-boew/wet-boew-moodle/archive/master.zip
# unzip master.zip -d $APP_DATA/theme
# rm master.zip

# Upgrade the Moodle database non-interactively.
cd $APP_DATA
/opt/rh/rh-php72/root/usr/bin/php admin/cli/upgrade.php --non-interactive
/opt/rh/rh-php72/root/usr/bin/php admin/cli/purge_caches.php
/opt/rh/rh-php72/root/usr/bin/php admin/cli/maintenance.php --disable

# Remove PHP Composer folders
rm -rf $APP_DATA/vender
rm -rf $APP_DATA/node_modules

# Schedule cron to run every 1 minute. (cron service not available in container)
# (crontab -l && echo "* * * * * /opt/rh/rh-php72/root/usr/bin/php /opt/app-root/src/admin/cli/cron.php") | crontab -
