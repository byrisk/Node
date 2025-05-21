name: 定时运行 curl 命令

on:
  schedule:
    # 每 30 分钟运行一次
    - cron: '*/15 * * * *'
  workflow_dispatch:

jobs:
  run_curl:
    runs-on: ubuntu-latest
    steps:
      - name: 运行 curl 命令
        run: |
          curl -X GET 'https://sapi.egvra.cn/m/reg.aspx?k=aQTmOx4tXvGzXvGyWDcuXfgzbDEuWvGxXjsyXy7dL5deY8KxYDgzXf7hbQxe' \
          -H 'User-Agent: Dart/3.4 (dart:io)' \
          -H 'Accept-Encoding: gzip' \
          -H 'Content-Type: application/json' \
          -d 'XfPhK860KfhiX5c1XvKxLJstXRtgOzK=' \
          --http1.1
