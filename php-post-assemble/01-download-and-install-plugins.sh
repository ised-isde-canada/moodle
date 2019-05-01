#!/bin/bash

export GIT_COMMITTER_NAME=ISED-ISDE
export GIT_COMMITTER_EMAIL=ised-isde@canada.ca

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

# Filters: Multi-Language Content (v2).
if [ -d "$APP_DATA/filter/multilang2" ]; then rm -Rf $APP_DATA/filter/multilang2; fi
#wget https://moodle.org/plugins/download.php/17314/filter_multilang2_moodle36_2018070401.zip
#unzip filter_multilang2_moodle36_2018070401.zip
#rm filter_multilang2_moodle36_2018070401.zip
#mv multilang2 $APP_DATA/filter/
mkdir -p $APP_DATA/filter/multilang2
cd $APP_DATA/filter/multilang2
git init
git remote add -t master -f origin https://github.com/iarenaza/moodle-filter_multilang2.git
git checkout master

# Filters: FilterCodes.
if [ -d "$APP_DATA/filter/filtercode" ]; then rm -Rf $APP_DATA/filter/filtercode; fi
#wget https://moodle.org/plugins/download.php/18348/filter_filtercodes_moodle36_2018112600.zip
#unzip filter_filtercodes_moodle36_2018112600.zip
#rm filter_filtercodes_moodle36_2018112600.zip
#mv filtercodes $APP_DATA/filter/
mkdir -p $APP_DATA/filter/filtercode
cd $APP_DATA/filter/filtercode
git init
git remote add -t master -f origin https://github.com/michael-milette/moodle-filter_filtercodes.git
git checkout master

# Local: eMail Test.
if [ -d "$APP_DATA/local/mailtest" ]; then rm -Rf $APP_DATA/local/mailtest; fi
#wget https://moodle.org/plugins/download.php/16831/local_mailtest_moodle36_2018052100.zip
#unzip local_mailtest_moodle36_2018052100.zip
#rm local_mailtest_moodle36_2018052100.zip
#mv mailtest $APP_DATA/local/
mkdir -p $APP_DATA/local/mailtest
cd $APP_DATA/local/mailtest
git init
git remote add -t master -f origin https://github.com/michael-milette/moodle-local_mailtest.git
git checkout master

# Local: Kopere Dashboard.
if [ -d "$APP_DATA/local/kopere_dashboard" ]; then rm -Rf $APP_DATA/local/kopere_dashboard; fi
wget https://moodle.org/plugins/download.php/19201/local_kopere_dashboard_moodle36_2019031900.zip
unzip local_kopere_dashboard_moodle36_2019031900.zip
rm local_kopere_dashboard_moodle36_2019031900.zip
mv EduardoKrausME-moodle-local-kopere_dashboard-7e28608 $APP_DATA/local/kopere_dashboard

# Theme: WET-BOEW-MOODLE-GCWEB.
if [ -d "$APP_DATA/theme/wetboew_gcweb" ]; then rm -Rf $APP_DATA/theme/wetboew_gcweb; fi
git clone https://github.com/michael-milette/moodle_theme-test.git $APP_DATA/theme/wetboew_gcweb

# This one seems to break Moodle 3.6.
# wget https://github.com/wet-boew/wet-boew-moodle/archive/master.zip
# unzip master.zip -d $APP_DATA/theme
# rm master.zip

# Remove PHP Composer folders.
if [ -d "$APP_DATA/vender" ]; then rm -Rf $APP_DATA/vender; fi
if [ -d "$APP_DATA/node_modules" ]; then rm -Rf $APP_DATA/node_modules; fi

# Make post-installation script executable.
chmod +w /opt/app-root/src/php-post-init/post-installation.sh
