#!/bin/bash

LOCAL_DIR="/home/ahmad/Documents/Flutter/flutter-todo/flutter_todo/lib"
REMOTE_USER="orangepi"
REMOTE_IP="192.168.8.30"
REMOTE_DIR="/home/orangepi/Documents/flutter_todo"
PASSWORD="orangepi"
sshpass -p "$PASSWORD" rsync -avz --exclude={'lib/objectbox.g.dart','lib/objectbox-model.json'} --progress --delete "$LOCAL_DIR" "$REMOTE_USER@$REMOTE_IP:$REMOTE_DIR"
echo "Sync Completed..."

