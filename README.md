# 自宅で始める Learning Analytics Platform の構築

## LMS (moodle) の起動

```
docker compose up -d
```

http://localhost でアクセスできる

## LRS (Learning Locker) の起動

```
docker compose -f docker-compose-lrs.yml up -d
```

http://localhost:3000 で Learning Locker の Dashboard にアクセスできます
