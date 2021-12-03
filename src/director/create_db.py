#!/usr/bin/python3
import db

dbCon, dbCur = db.open_db(director_config, False)
db.install_db(dbCon, dbCur, director_config)
db.close_db(dbCon)



