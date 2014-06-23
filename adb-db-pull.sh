#!/bin/bash

# Copyright (c) 2014 Leonard Wu <leonard.wu92@alumni.ic.ac.uk>
# MIT License
# Android SQLite DB Pull (adb-db-pull, v1.2)
# https://github.com/leonardw/adb-db-pull.git

ADB=`which adb`
ADB_SHELL="$ADB shell"
SELF=`basename $0`
DEST_DIR="./"

if [ $? -ne 0 ]
then
    echo "adb runtime not found. Please install Android SDK and add into PATH"
    exit 1
fi;
# Show usage info if incorrect num of args
if [ $# -ne 2 ]
then
    echo "Usage: $SELF [PACKAGE.NAME [DB_FILE]]"
    echo "eg. $SELF com.mydomain.myapp names.db"
fi;
# Quit if more than max num of args
if [ $# -gt 2 ]
then
    exit 1
fi;

# No args, try list all package names
if [ $# -eq 0 ]
then
    cmd_list_pkg="$ADB_SHELL 'ls -d /data/data/*/databases  | cut -d \"/\" -f 4' "
    echo ""
    echo "Packages with SQLite DBs found on device:"
    eval $cmd_list_pkg
    exit 0
fi;

# One arg, try list all DBs under given package
if [ $# -eq 1 ]
then
    cmd_list_db="$ADB_SHELL 'ls /data/data/$1/databases/' "
    echo ""
    echo "SQLite DBs found under $1 on device:"
    eval $cmd_list_db
    exit 0
fi;

# Two args, pull specified DB to local
if [ $# -eq 2 ]
then
    cmd_snapshot="$ADB_SHELL 'run-as $1 cat /data/data/$1/databases/$2 > /sdcard/$2' "
    # echo $cmd_snapshot
    eval $cmd_snapshot
    err=$?
    if [ $err -eq 0 ]
    then
        echo "Done: snapshot"
    else
        echo "Failed: snapshot"
        exit err
    fi;
    cmd_pull="$ADB pull /sdcard/$2 $DEST_DIR"
    # echo $cmd_pull
    eval $cmd_pull
    err=$?
    if [ $err -eq 0 ]
    then
        echo "Done: ADB pull"
    else
        echo "Failed: ADB pull"
        exit err
    fi;
fi;
exit 0
