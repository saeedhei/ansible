# Adding a CouchDB Node to a Cluster Manually

This guide explains how to manually add a CouchDB node (e.g., `db2.seointro.de`) to a cluster using `curl`.

## Steps to Add a Node

### 1. Enable Cluster Mode on the New Node
On the new node (e.g., `db2.seointro.de`), enable clustering:

```bash
curl -X POST http://admin:password@db2.seointro.de:5984/_cluster_setup \
     -H "Content-Type: application/json" \
     -d '{
           "action": "enable_cluster",
           "bind_address": "0.0.0.0",
           "username": "admin",
           "password": "password"
         }'
```

### 2. Add the New Node to the Cluster
From the **primary (coordinator) node** (e.g., `127.0.0.1`), add the new node to the cluster:

```bash
curl -X POST http://admin:password@127.0.0.1:5984/_cluster_setup \
     -H "Content-Type: application/json" \
     -d '{
           "action": "add_node",
           "host": "db2.seointro.de",
           "port": 5984,
           "username": "admin",
           "password": "password"
         }'
```

### 3. Complete the Cluster Setup
After adding all nodes to the cluster, finalize the setup:

```bash
curl -X POST http://admin:password@127.0.0.1:5984/_cluster_setup \
     -H "Content-Type: application/json" \
     -d '{"action":"finish_cluster"}'
```

## Verification
To verify the cluster setup, query the `_membership` endpoint on any node:

```bash
curl -X GET http://admin:password@127.0.0.1:5984/_membership
```

This should list all nodes in the cluster, including `db2.seointro.de`.

## Troubleshooting

- **Network Issues**: Ensure all nodes are reachable via their hostname or IP address.
- **Firewall Rules**: Open necessary ports (e.g., `5984`, `4369`) for communication.
- **Unique Node Names**: Verify that `NODENAME` (Erlang node name) is unique for each CouchDB instance in the cluster.

### Example of Successful Membership
The `_membership` response should look like this:

```json
{
  "all_nodes": [
    "couchdb@127.0.0.1",
    "couchdb@db2.seointro.de"
  ],
  "cluster_nodes": [
    "couchdb@127.0.0.1",
    "couchdb@db2.seointro.de"
  ]
}


curl -X POST http://admin:password@127.0.0.1:5984/_cluster_setup \
     -H "Content-Type: application/json" \
     -d '{
           "action": "remove_node",
           "host": "db2.seointro.de",
           "port": 5984
         }'



curl http://admin:password@db2.seointro.de:5984/


// Run a test from db1 to db2:
nc -zv db2.seointro.de 4369
nc -zv db2.seointro.de 9100
nc -zv db2.seointro.de 9100-9200

curl -X GET http://admin:password@89.117.54.249:5984/_cluster_setup
curl -X GET http://admin:password@45.88.188.201:5984/_cluster_setup

curl -X POST http://admin:password@89.117.54.249:5984/_cluster_setup -H "Content-Type: application/json" -d '{"action": "finish_cluster"}'
curl -X POST http://admin:password@45.88.188.201:5984/_cluster_setup -H "Content-Type: application/json" -d '{"action": "finish_cluster"}'

curl -X GET http://admin:password@89.117.54.249:5984/_membership
curl -X GET http://admin:password@45.88.188.201:5984/_membership


curl http://45.88.188.201:5984
curl http://89.117.54.249:5984

https://github.com/apache/couchdb/issues/2054
-kernel inet_dist_use_interface {0,0,0,0}
-kernel inet_dist_listen_min 9100
-kernel inet_dist_listen_max 9110
curl -X GET http://admin:password@89.117.54.249:5984/_node/_local/_config/chttpd/bind_address
curl -X GET http://admin:password@45.88.188.201:5984/_node/_local/_config/chttpd/bind_address

sudo nano /etc/hosts

nslookup db1.seointro.de
nslookup db2.seointro.de

curl -X GET http://admin:password@89.117.54.249:5984/_membership
curl -X GET http://admin:password@45.88.188.201:5984/_membership

curl -X POST http://admin:password@89.117.54.249:5984/_cluster_setup \
     -H "Content-Type: application/json" \
     -d '{
           "action": "remove_node",
           "host": "45.88.188.201",
           "port": 5984
         }'

curl -I http://45.88.188.201:5984
curl -I http://db2.seointro.de:5984

curl -X POST http://admin:password@89.117.54.249:5984/_cluster_setup \
  -H "Content-Type: application/json" \
  -d '{"action":"enable_cluster","bind_address":"0.0.0.0","username":"admin","password":"password","node_count":3,"remote_node":"couchdb@45.88.188.201","remote_current_user":"admin","remote_current_password":"password"}'


# Step 1: Add the second node to the cluster
curl -X POST http://admin:password@89.117.54.249:5984/_cluster_setup \
     -H "Content-Type: application/json" \
     -d '{
         "action": "add_node",
         "host": "45.88.188.201",
         "username": "admin",
         "password": "password"
     }'

# Step 2: Finish setting up the cluster
curl -X POST http://admin:password@89.117.54.249:5984/_cluster_setup \
     -H "Content-Type: application/json" \
     -d '{
         "action": "finish_cluster"
     }'

curl --user admin:password 'http://89.117.54.249:5984/_node/_local/_config/couchdb/uuid'    

curl -X GET http://admin:password@89.117.54.249:5984/_node/_local/_config/admins

curl -X PUT http://admin:password@89.117.54.249:5984/_node/_local/_config/admins/saeed \
     -d '"password"'

curl -X POST http://admin:password@89.117.54.249:5984/_cluster_setup \
     -H "Content-Type: application/json" \
     -d '{
         "action": "finish_cluster"
     }'

// update password
curl -X PUT http://admin:password@89.117.54.249:5984/_node/_local/_config/admins/admin \
     -d '"password"'

// Force Password Sync (if necessary):
curl -X PUT http://admin:password@89.117.54.249:5984/_node/couchdb@89.117.54.249/_config/admins/admin \
     -d '"password"'     




// all config
curl -X GET http://admin:password@89.117.54.249:5984/_node/_local/_config

curl -X PUT http://admin:password@89.117.54.249:5984/_node/_local/_config/chttpd/require_valid_user -d '"true"'



curl -X DELETE http://admin:password@89.117.54.249:5984/_session

curl -X GET http://admin:password@89.117.54.249:5984/_all_dbs
curl -X GET http://admin:password@89.117.54.249:5984/saeed




curl -X POST http://admin:password@89.117.54.249:5984/_cluster_setup \
     -H "Content-Type: application/json" \
     -d '{"action":"finish_cluster"}'