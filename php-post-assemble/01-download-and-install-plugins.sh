#!/bin/bash

# For GitHub
export GIT_COMMITTER_NAME=ISED-ISDE
export GIT_COMMITTER_EMAIL=ised-isde@canada.ca

# Moodle Version - Always manually check each plugin to verify whether
# there is a specific branch associated with the version of Moodle.
# Parse the branch number from version.php.
export VERSION=$(grep -oE 'branch .* = .*;' $APP_DATA/version.php | awk -F \' '{print $2}')

# Activities: Custom certificate
if [ -d "$APP_DATA/mod/customcert" ]; then rm -Rf $APP_DATA/mod/customcert; fi
mkdir -p $APP_DATA/mod/customcert
cd $APP_DATA/mod/customcert
git init
git remote add -t MOODLE_${VERSION}_STABLE -f origin https://github.com/markn86/moodle-mod_customcert.git
git remote add -t MOODLE_${VERSION}_STABLE -f upstream https://github.com/ised-isde-canada/moodle-mod_customcert.git
git checkout -t upstream/MOODLE_${VERSION}_STABLE

# Blocks: Completion Progress
if [ -d "$APP_DATA/blocks/completion_progress" ]; then rm -Rf $APP_DATA/blocks/completion_progress; fi
mkdir -p $APP_DATA/blocks/completion_progress
cd $APP_DATA/blocks/completion_progress
git init
git remote add -t master -f origin https://github.com/deraadt/moodle-block_completion_progress.git
git remote add -t master -f upstream https://github.com/ised-isde-canada/moodle-block_completion_progress.git
git checkout -t upstream/master

# Blocks: Configurable Reports
if [ -d "$APP_DATA/blocks/configurable_reports" ]; then rm -Rf $APP_DATA/blocks/configurable_reports; fi
mkdir -p $APP_DATA/blocks/configurable_reports
cd $APP_DATA/blocks/configurable_reports
git init
git remote add -t MOODLE_36_STABLE -f origin https://github.com/jleyva/moodle-block_configurablereports.git
git remote add -t MOODLE_36_STABLE -f upstream https://github.com/ised-isde-canada/moodle-block_configurablereports.git
git checkout -t upstream/MOODLE_36_STABLE

# Filters: Multi-Language Content (v2).
if [ -d "$APP_DATA/filter/multilang2" ]; then rm -Rf $APP_DATA/filter/multilang2; fi
mkdir -p $APP_DATA/filter/multilang2
cd $APP_DATA/filter/multilang2
git init
git remote add -t master -f origin https://github.com/iarenaza/moodle-filter_multilang2.git
git remote add -t master -f upstream https://github.com/ised-isde-canada/moodle-filter_multilang2.git
git checkout -t upstream/master

# Filters: FilterCodes.
if [ -d "$APP_DATA/filter/filtercodes" ]; then rm -Rf $APP_DATA/filter/filtercodes; fi
mkdir -p $APP_DATA/filter/filtercodes
cd $APP_DATA/filter/filtercodes
git init
git remote add -t master -f origin https://github.com/michael-milette/moodle-filter_filtercodes.git
git remote add -t master -f upstream https://github.com/ised-isde-canada/moodle-filter_filtercodes.git
git checkout -t upstream/master

# Local: eMail Test.
if [ -d "$APP_DATA/local/mailtest" ]; then rm -Rf $APP_DATA/local/mailtest; fi
mkdir -p $APP_DATA/local/mailtest
cd $APP_DATA/local/mailtest
git init
git remote add -t master -f origin https://github.com/michael-milette/moodle-local_mailtest.git
git remote add -t master -f upstream https://github.com/ised-isde-canada/moodle-local_mailtest.git
git checkout -t upstream/master

# Local: Adminer - IMPORTANT - DOT NOT INCUDE IN PRODUCTION SITE.
if [ -d "$APP_DATA/local/adminer" ]; then rm -Rf $APP_DATA/local/adminer; fi
mkdir -p $APP_DATA/local/adminer
cd $APP_DATA/local/adminer
git init
git remote add -t MOODLE_35_STABLE -f origin https://github.com/grabs/moodle-local_adminer.git
git remote add -t MOODLE_35_STABLE -f upstream https://github.com/ised-isde-canada/moodle-local_adminer.git
git checkout -t origin/MOODLE_35_STABLE

# Theme: WET-BOEW-MOODLE-CDTS-INTERNET.
if [ -d "$APP_DATA/theme/wetboew_internet" ]; then rm -Rf $APP_DATA/theme/wetboew_internet; fi
mkdir -p $APP_DATA/theme/wetboew_internet
cd $APP_DATA/theme/wetboew_internet
git init
git remote add -t master -f origin https://github.com/michael-milette/moodle_theme-wetboew_internet.git
git remote add -t master -f upstream https://github.com/michael-milette/moodle_theme-wetboew_internet.git
git checkout -t upstream/master

## Theme: WET-BOEW-MOODLE-GCWeb.
#if [ -d "$APP_DATA/theme/gcweb" ]; then rm -Rf $APP_DATA/theme/gcweb; fi
#mkdir -p $APP_DATA/theme/gcweb
#cd $APP_DATA/theme/gcweb
#git init
#git remote add -t master -f origin https://github.com/michael-milette/moodle_theme-gcweb.git
#git remote add -t master -f upstream https://github.com/michael-milette/moodle_theme-gcweb.git
#git checkout -t upstream/master
#
## Theme: WET-BOEW-MOODLE-GCIntranet.
#if [ -d "$APP_DATA/theme/gcintranet" ]; then rm -Rf $APP_DATA/theme/gcintranet; fi
#mkdir -p $APP_DATA/theme/gcintranet
#cd $APP_DATA/theme/gcintranet
#git init
#git remote add -t master -f origin https://github.com/michael-milette/moodle_theme-gcintranet.git
#git remote add -t master -f upstream https://github.com/michael-milette/moodle_theme-gcintranet.git
#git checkout -t upstream/master

# Remove PHP Composer folders.
if [ -d "$APP_DATA/vender" ]; then rm -Rf $APP_DATA/vender; fi
if [ -d "$APP_DATA/node_modules" ]; then rm -Rf $APP_DATA/node_modules; fi

# Copy WebTrends JavaScript file into place.
cp $APP_DATA/php-post-assemble/webtrends_moodle.js $APP_DATA/
