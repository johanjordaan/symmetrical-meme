import db

dbCon, dbCur = db.open_db(False)
db.install_db(dbCon, dbCur)
db.close_db(dbCon)



