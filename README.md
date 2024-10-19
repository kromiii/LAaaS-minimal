# 自宅で始める Learning Analytics Platform の構築

## LMS (moodle) の起動

```
docker compose -f moodle/docker-compose.yml up -d
```

http://localhost でアクセスできる

user と password は user/bitnami

## LRS (Learning Locker) の起動

```
docker compose -f learninglocker/docker-compose.yml up -d
```

http://localhost:3000 で Learning Locker の Dashboard にアクセスできます

## Dashboard (superset) の起動

```
docker compose -f superset/docker-compose.yml up -d
```

http://localhost:8088 で Superset の Dashboard にアクセスできます

user と password は admin/admin

## LRS (Learning Locker) の設定

### LRSの作成

Settings->Storesから新しいLRSを作成

Clientにuserとkeyが出力されるので控えておく

### Logstore xAPIの設定

http://localhost/admin/settings.php?section=logsettingxapi にアクセス

username と key に先ほど控えた文字列を貼り付け

endpointにはこちらを指定する

http://learninglocker:8081/data/xAPI/statements

この状態でmoodleを操作するとログがLRSに保存されるはず

デバッグ用のコマンド

```
curl -X POST http://learninglocker:8081/data/xAPI/statements \
     -H "Content-Type: application/json" \
     -H "X-Experience-API-Version: 1.0.3" \
     -H "Authorization: Basic ZmZmM2IzODczMTI5NjI5YTBiZmVlNWE4YmQ4MzU1YzNjYjA5ZTk3NzowMjNkYzYyNTY1ZWZjZTA1MTVhMDE1YzEwYmFmNDA4OWMzMTlhZTkz" \
     -d '{
       "actor": {
         "mbox": "mailto:example@example.com",
         "name": "Example Learner",
         "objectType": "Agent"
       },
       "verb": {
         "id": "http://adlnet.gov/expapi/verbs/completed",
         "display": {"en-US": "completed"}
       },
       "object": {
         "id": "http://example.com/activities/course1",
         "definition": {
           "name": {"en-US": "Example Course"},
           "type": "http://adlnet.gov/expapi/activities/course"
         },
         "objectType": "Activity"
       }
     }'
```
