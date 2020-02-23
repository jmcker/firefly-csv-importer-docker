#
# This script will kick off the CSV importer on the command line, using Docker run.
# After it has run, the container will be stopped and removed automatically.
# To configure this script, change the variables below to your liking.

#
# Create a personal access token in your Firefly III installation, under 'Profile'
#
PERSONAL_ACCESS_TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTZjMmEyZjBjNjdlNDlhMTliMWNiYmUwODc0OTdlNTU4Y2Q0YzZmZjBmMzg1YTNiYjM0ODhjYzgxYzM2ZTllMWY4YmIyMTQyM2IyNjE0ZTAiLCJpYXQiOjE1ODI0NDQ0NDAsIm5iZiI6MTU4MjQ0NDQ0MCwiZXhwIjoxNjE0MDY2ODQwLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ox_4qOU4T8-HJHy3RCL75TrP6HeaOz0bZURL8AxMxqnlz-AnIQv9iC80NBwpKniSyz7wfphTBFxbfEojePyQoorTS-d9cyjKm9_-9jYlbYdVEuG_wsY9462tz9n08ehkMSXDiWdKittLTrfHMhLN5k1mQX-QpKrqxa95CGd1qjDUARndX10tE5V_WJMcR75OuRnakG4gg_nmuoc7BkD9wmlf-ojRobG5nrgbEku2BLatV8rxr9KDUlpIcOE6kS3SL_9TzDb5BPwnnkuQZBoBvyZe_oGA9LsLpk4ftJh1OnJyfIImPC4jacKoGmshBfP5Oo98aIugRqeUbIoDqQz8I_6fEtg4lpm95Cx0zrMqvIrDFw2dbOeCHEndJpKotJyjrY3opFISdBBloWfakIk6cZGXqzPGFHMMX_JlcANxn9rUOdtNiJ5tsJxTnwiu9WhCLVNj0HgA3XuUxyeWupGlXYeWjQVjuKEi17VcNX4RFs5D2SLXuEiIIDm3HD4csvMS1JD0_wq9mT2Ql6_1ByS4qB_E05WPbCgQIJF969U_OpwhxdzV4tGNnoiKi_845XO3YNi7_JZtqOlXAVvBkrKKu2d1LzuJHnWjvDI_TGkyj7fsXulWL34syLRn2jAJBHFi1bl3UgD4Q5c1O9fp8XXzZHxcpOI1C_Kv_9Ge0X8HEjQ

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
jc5x/csv-importer:develop
