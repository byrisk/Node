name: Recurring API Calls (Every 30 Min)

on:
  schedule:
    # Runs every 30 minutes
    # MONDAY - SUNDAY (0-6)
    # The '*/30' in the minute position means "every 30th minute"
    - cron: '*/30 * * * *'
  workflow_dispatch:
    # Allows you to manually trigger the workflow from the GitHub Actions UI

jobs:
  run_curl_commands:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v4

    - name: Execute curl commands
      env:
        # Define these as secrets in your GitHub repository!
        CFLIST_K: ${{ secrets.CURL_K_CFLIST }}
        SIGN: ${{ secrets.CURL_SIGN }}
        VER: ${{ secrets.CURL_VER }}
        TG: ${{ secrets.CURL_TG }}
        SEC: ${{ secrets.CURL_SEC }}
        TOKEN: ${{ secrets.CURL_TOKEN }}
      run: |
        echo "--- Executing first curl command (cflist.aspx) ---"
        curl -X GET "https://sapi.egvra.cn/m/cflist.aspx?k=${{ env.CFLIST_K }}&sign=${{ env.SIGN }}&ver=${{ env.VER }}&tg=${{ env.TG }}&sec=${{ env.SEC }}&token=${{ env.TOKEN }}" \
          -H 'User-Agent: Dart/3.4 (dart:io)' \
          -H 'Accept-Encoding: gzip' \
          -H 'Content-Type: application/json' \
          --output cflist_response.txt

        echo "First curl command finished. Response saved to cflist_response.txt"
        cat cflist_response.txt # Display the content

        echo "" # Newline for separation

        echo "--- Executing second curl command (loginalertnotemsg.aspx) ---"
        curl -X GET "https://sapi.egvra.cn/m/loginalertnotemsg.aspx?sign=${{ env.SIGN }}&ver=${{ env.VER }}&tg=${{ env.TG }}&sec=${{ env.SEC }}&token=${{ env.TOKEN }}" \
          -H 'User-Agent: Dart/3.4 (dart:io)' \
          -H 'Accept-Encoding: gzip' \
          -H 'Content-Type: application/json' \
          --http1.1 \
          --output loginalert_response.txt

        echo "Second curl command finished. Response saved to loginalert_response.txt"
        cat loginalert_response.txt # Display the content

        echo "All curl commands executed successfully."
