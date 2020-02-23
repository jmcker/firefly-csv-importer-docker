docker run -d \
-p 80:80 \
-e FIREFLY_III_ACCESS_TOKEN=a \
-e FIREFLY_III_URI=b \
-e APP_KEY=CHANGEMECHANGEMECHANGEMECHANGEME \
-e WEB_SERVER=true \
--name=csv \
csv_test:latest