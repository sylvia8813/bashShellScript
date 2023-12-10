#!bin/bash
#創建一個備份腳本test2.sh

#原始檔案的路徑
source="/home/sylvia/bin"
#目的檔案的路徑
destination="/home/sylvia/backup"
#建立備份完的檔案，會從crontab中讀取指定備份的頻率0 2 * * *，表示每天凌晨兩點自動備份
backup_folder="$destination/backup_$(date +%Y%m%d%H%M%S)"
#使用mkdir -p命令創建備份目錄，-p選項表示如果目錄已經存在，就不報錯
mkdir -p $backup_folder
#使用rsync工具進行目錄同步。-a選項表示以遞歸模式進行同步，保持所有屬性
rsync -a $source/ $backup_folder/
#將輸出的時間改為英文，看起來比較爽XD
export LC_TIME=en_US.UTF-8
#輸出備份成功，後面會有成功的時間，並且會自動在目標路徑建立備份檔案
echo "Backup completed on $(date)."  $destination/backup_log.txt