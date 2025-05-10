
# Delete the User Document
curl -X GET http://admin:password@89.117.54.249:5984/_users/org.couchdb.user:a
curl -X DELETE http://admin:password@89.117.54.249:5984/_users/org.couchdb.user:a?rev=3-6f6074ae807379ffc02878f2f1e16397

# Add a User
curl -X PUT http://admin:password@127.0.0.1:5984/_users/org.couchdb.user:john \
  -H "Content-Type: application/json" \
  -d '{
    "name": "john",
    "password": "mypassword",
    "roles": ["developers"],
    "type": "user"
  }'

# Add a User with varaiable
USER_NAME="xxx"
USER_PASSWORD="xxx"

curl -X PUT "http://admin:password@89.117.54.249:5984/_users/org.couchdb.user:$USER_NAME" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "'"$USER_NAME"'",
    "password": "'"$USER_PASSWORD"'",
    "roles": ["developers"],
    "type": "user"
  }'


curl -X GET http://a:%23@89.117.54.249:5984/testdb

http://89.117.54.249:5984/_utils/#/database/saeed/_all_docs


curl -X GET http://admin:password@89.117.54.249:5984/_users/org.couchdb.user:arthur
curl -X GET http://arthur:%23SeointroTeam@89.117.54.249:5984/gallusgarten

curl -X GET http://admin:password@89.117.54.249:5984/gallusgarten


curl -X GET https://admin:password@couchdb.seointro.de/gallusgarten



USER_NAME="xxx"
USER_PASSWORD="xxx"

curl -X PUT "http://admin:password@89.117.54.249:5984/_users/org.couchdb.user:$USER_NAME" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "'"$USER_NAME"'",
    "password": "'"$USER_PASSWORD"'",
    "roles": ["developers"],
    "type": "user"
  }'