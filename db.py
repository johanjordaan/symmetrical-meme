import mysql.connector as mysql
import config
import os
import time
from datetime import datetime

#os.environ['TZ'] = 'Australia/Sydney'
#time.tzset()


def install_db(db, cursor):
    cursor.execute('SHOW DATABASES like "%s"' % config.database)
    databases = cursor.fetchall()
    if len(databases) < 1:
        print('Creating database [%s]' % config.database)
        cursor.execute('CREATE DATABASE %s' % config.database)
    else:
        print('Database [%s] already exists' % config.database)
    cursor.execute("USE %s" % config.database)
    cursor.execute("""
        create table if not exists heartbeat 
        (
            hostname varchar(150) not null,
            utcdt    datetime     not null
        );
    """)


def open_db(use=True):
    db = mysql.connect(
        host=config.host,
        user=config.user,
        passwd=config.password
    )
    cursor = db.cursor()
    if use:
        cursor.execute("USE %s" % config.database)
    return db, cursor


def add_heartbeat(heartbeat):
    dbCon, dbCur = open_db()
    query = "INSERT INTO heartbeat (hostname,utcdt) VALUES (%s, %s)"
    values = (heartbeat['hostname'], heartbeat['utcdt'])
    dbCur.execute(query, values)
    close_db(dbCon)


def close_db(db):
    db.commit()
    db.close()
