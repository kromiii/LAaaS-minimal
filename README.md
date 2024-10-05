# LAaaS-minimal

## What is this?

This is a minimal structure of Learning Analytics (LA) platform, which consists of LMS (moodle) and LRS (Learning Locker).

You can set the LA platform on your local machine with a single command.

```
docker-compose up -d
```

You can access to the moodle (htttp://localhost:8000) and learning locker (http://localhost:3000) with your browser.

## Motivation

Recently, I found an excellent repository called [LAaaS-docker](https://github.com/RCOSDP/LAaaS-docker).

It enables us to run multiple container images such as LMS, LRS, and Data analytics on a single docker compose file.

However, as it is expected to run on a external 3rd party cloud service such as AWS, it is not so easy to run on a local machine (especially on ARM64).

So, I created a minimal version of LAaaS-docker, which can easily run on a local machine.
