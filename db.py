import mysql.connector as mysql

def install_db(db, cursor, config):
    cursor.execute('SHOW DATABASES like "%s"' % config.database)
    databases = cursor.fetchall()
    if len(databases) < 1:
        print('Creating database [%s]' % config.database)
        cursor.execute('CREATE DATABASE %s' % config.database)
    else:
        print('Database [%s] already exists' % config.database)
    cursor.execute("USE %s" % config.database)
    cursor.execute("""
        create table if not exists events 
        (
            type     varchar(50)   not null,
            hostname varchar(150)  not null,
            gap      int           not null,  
            utcdt    datetime      not null,
            value    double        not null
        );
    """)

def open_db(config, use=True):
    db = mysql.connect(
        host=config.host,
        user=config.user,
        passwd=config.password
    )
    cursor = db.cursor()
    if use:
        cursor.execute("USE %s" % config.database)
    return db, cursor


def add_event(config, event):
    dbCon, dbCur = open_db(config)
    query = "INSERT INTO events (type,hostname,gap,utcdt,value) VALUES (%s, %s, %s, %s, %s)"
    values = (event['type'], event['hostname'], event['gap'], event['utcdt'], event['value'])
    dbCur.execute(query, values)
    close_db(dbCon)


def close_db(db):
    db.commit()
    db.close()
