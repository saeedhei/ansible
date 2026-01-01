curl -X PUT http://admin:password@89.117.54.249:5984/saeed/_security \
  -H "Content-Type: application/json" \
  -d '{
        "members": {
          "names": ["a"], 
          "roles": ["developers"]
        }
      }'

curl -X PUT http://admin:password@89.117.54.249:5984/<db>/_security \
  -H "Content-Type: application/json" \
  -d '{
        "admins": {
          "names": ["admin_user"], 
          "roles": ["admin"]
        },
        "members": {
          "names": ["a"], 
          "roles": []
        }
      }'

 curl -X GET http://admin:password@89.117.54.249:5984/saeed/_security
     

curl -X PUT http://admin:password@89.117.54.249:5984/saeed/_security \
  -H "Content-Type: application/json" \
  -d '{
        "admins": {
          "names": ["admin"],
          "roles": []
        },
        "members": {
          "names": ["a"],
          "roles": []
        }
      }'

