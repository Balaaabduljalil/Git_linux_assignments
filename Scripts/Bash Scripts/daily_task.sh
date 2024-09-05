#!/bin/bash
log_file = "/home/ballabduljalil@gmail.com/logs/daily_task.log" #i have define the log file
mkdir -p (my_daily_cron_task "log_file") #creating the logs directory named my_daily_cron_task
echo "Running daily task at $12:00AM"  >> "$log_file" #writen the dates and time to log file
crontab -e # scheduling the cron job
00 * * * /home/ballaabduljalil@gmial.com/scripts/daily_task.sh #added my path scripts schedule to run daily at 12:00AM.

