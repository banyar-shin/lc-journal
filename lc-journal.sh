#!/bin/zsh

# This is a shell script to add entries to my LeetCode Journal.
# Maybe I can turn this idea into a whole journal app?
# Developer: banyar-shin
# Link: https://github.com/banyar-shin/

LCJ_ERROR="LeetCode Journal

\e[4mUsage:\e[0m lcj <COMMAND>

\e[4mCommands:\e[0m
  open  (o)   Opens the journal
  start (s)   Starts the day
  add   (a)   Adds a journal entry
  edit  (e)   Edits the journal script"

case $1 in

"s" | "start") # start day to print type in journal
LCJ_DATE=$(date "+%A, %D" | tr -d '\n')
echo "\n<h4 align=\"center\">$LCJ_DATE</h4>" >> "$LCJ_PATH/lc-journal.md"
;;

"a" | "add") # add journal entry
echo "LeetCode Title: " | tr -d '\n'
read LCJ_TITLE

echo "
URL: " | tr -d '\n'
read LCJ_URL

echo "
Brief Description: " | tr -d '\n'
read LCJ_DESC

LCJ_TIME=$(date "+%H:%M:%S" | tr -d '\n')

echo "
<details>
  <summary>$LCJ_TITLE</summary>

  - $LCJ_DESC
  - $LCJ_URL

</details>" >> "$LCJ_PATH/lc-journal.md"
;;

"o" | "open") # open journal in nvim
nvim "$LCJ_PATH/lc-journal.md"
;;

"e" | "edit") # edit journal script in nvim
nvim "$LCJ_PATH/lc-journal.sh"
;;

*) # default case, no arguments
echo -e "$LCJ_ERROR"
;;

esac
