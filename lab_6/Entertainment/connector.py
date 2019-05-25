import MySQLdb

db = MySQLdb.connect(
    host='localhost',
    user='dbuser',
    passwd='123',
    db='mydb'
)
c = db.cursor()
db.commit()
c.execute('SELECT * FROM musician;')
entries = c.fetchall()
for item in entries:
    print(item)
c.close()
db.close()
