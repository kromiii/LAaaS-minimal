EMAIL_ADDRESS=admin@example.com
ORGANIZATION=personal
PASSWORD=password123
docker exec \
 -e EMAIL_ADDRESS=${EMAIL_ADDRESS} \
 -e ORGANIZATION=${ORGANIZATION} \
 -e PASSWORD=${PASSWORD} learninglocker bash -c '\
    source ~/.bashrc;
    node ./cli/dist/server createSiteAdmin "${EMAIL_ADDRESS}" "${ORGANIZATION}" "${PASSWORD}"'
