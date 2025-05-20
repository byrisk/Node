#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "--- Executing first curl command (cflist.aspx) ---"
curl -X GET 'https://sapi.egvra.cn/m/cflist.aspx?k=6it2Nw7T5F74bRsyXy7dL5deY8KxYDgzXf7h&sign=67eae8b9f589765e&ver=14&tg=dsv&sec=XfPhK860KfhiX5c1XvKxLJstXRtgOzK=&token=RlzoEILU' \
  -H 'User-Agent: Dart/3.4 (dart:io)' \
  -H 'Accept-Encoding: gzip' \
  -H 'Content-Type: application/json' \
  --output cflist_response.txt # Save output to a file

echo "First curl command finished. Response saved to cflist_response.txt"
cat cflist_response.txt # Display the content

echo "" # Newline for separation

echo "--- Executing second curl command (loginalertnotemsg.aspx) ---"
curl -X GET 'https://sapi.egvra.cn/m/loginalertnotemsg.aspx?sign=67eae8b9f589765e&ver=14&tg=dsv&sec=XfPhK860KfhiX5c1XvKxLJstXRtgOzK=&token=RlzoEILU' \
  -H 'User-Agent: Dart/3.4 (dart:io)' \
  -H 'Accept-Encoding: gzip' \
  -H 'Content-Type: application/json' \
  --http1.1 \
  --output loginalert_response.txt # Save output to a file

echo "Second curl command finished. Response saved to loginalert_response.txt"
cat loginalert_response.txt # Display the content

echo "All curl commands executed successfully."
