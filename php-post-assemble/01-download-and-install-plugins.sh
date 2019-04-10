#!/bin/bash

wget https://moodle.org/plugins/download.php/19201/local_kopere_dashboard_moodle36_2019031900.zip
unzip local_kopere_dashboard_moodle36_2019031900.zip -d $APP_DATA/local
mv $APP_DATA/local/EduardoKrausME-moodle-local-kopere_dashboard-7e28608 $APP_DATA/local/kopere_dashboard
rm local_kopere_dashboard_moodle36_2019031900.zip

wget https://moodle.org/plugins/download.php/18884/theme_adaptable_moodle36_2019011701.zip
unzip theme_adaptable_moodle36_2019011701.zip -d $APP_DATA/theme
rm theme_adaptable_moodle36_2019011701.zip

# This one seems to break Moodle 3.6
# wget https://github.com/wet-boew/wet-boew-moodle/archive/master.zip
# unzip master.zip -d $APP_DATA/theme
# rm master.zip

