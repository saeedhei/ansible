roles/
└── couchdb/
    ├── defaults/
    │   └── main.yml
    │
    ├── handlers/
    │   └── main.yml
    │
    ├── tasks/
    │   ├── main.yml
    │   ├── directories.yml
    │   ├── docker-compose.yml
    │   ├── config.yml
    │   ├── start.yml
    │   ├── wait.yml
    │   │
    │   ├── cluster.yml
    │   ├── bootstrap.yml
    │   │
    │   ├── cluster/
    │   │   ├── enable.yml
    │   │   ├── add_nodes.yml
    │   │   ├── finish.yml
    │   │   └── verify.yml
    │   │
    │   └── bootstrap/
    │       ├── users.yml
    │       ├── databases.yml
    │       └── indexes.yml
    │
    ├── templates/
    │   ├── docker-compose.yml.j2
    │   └── local.ini.j2
    │
    └── README.md
    
دقیقاً همین نکته باعث شد که من نام گروه را از manager به bootstrap تغییر بدهم.

couchdb_node_id: 0 به معنی Manager نیست.

فقط یعنی:

اولین Node که یک بار عملیات /_cluster_setup را انجام می‌دهد.

بعد از اینکه Cluster ساخته شد، دیگر هیچ تفاوتی با بقیه Nodeها ندارد.

Deploy Nodes
      |
      v
directories.yml
      |
      v
docker-compose.yml
      |
      v
config.yml
      |
      v
start.yml
      |
      v
wait.yml


Cluster Bootstrap
      |
      v
prepare.yml
      |
      v
add_nodes.yml
      |
      v
finish.yml
      |
      v
verify.yml