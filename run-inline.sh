#
# This script will kick off the CSV importer on the command line, using Docker run.
# After it has run, the container will be stopped and removed automatically.
# To configure this script, change the variables below to your liking.

#
# Create a personal access token in your Firefly III installation, under 'Profile'
#
PERSONAL_ACCESS_TOKEN=ey...

#
# This is the full path to your Firefly III installation:
#
FIREFLY_III_URI=http:/172.17.0.3/

#
# There is no need to touch anything after this point, but if you're smart you're free to do so.
#
DIR=$PWD


echo "Link $DIR to /import"
docker run \
--rm \
-v $DIR:/import \
-e FIREFLY_III_ACCESS_TOKEN=$PERSONAL_ACCESS_TOKEN \
-e FIREFLY_III_URI=$FIREFLY_III_URI \
-e WEB_SERVER=false \
fireflyiii/csv-importer:develop
