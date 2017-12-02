import MySQLdb
import datetime

class Connection:
    def __init__(self, user, passwd, db, host='localhost'):
        self.host = host
        self.user = user
        self.passwd = passwd
        self.db = db
        self._connection = None

    @property
    def connection(self):
        return self._connection

    def __enter__(self):
        self.connect()

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.disconnect()

    def connect(self):
        if not self._connection:
            self._connection = MySQLdb.connect(
                host=self.host,
                user=self.user,
                passwd=self.passwd,
                db=self.db,
            )

    def disconnect(self):
        if self._connection:
            self._connection.close()


class Musician:
    def __init__(self, db_connection, name, birth, role):
        self.db_connection = db_connection.connection
        self.name = name
        self.birth = birth
        self.role = role

    def save(self):
        c = self.db_connection.cursor()
        c.execute("INSERT INTO musician (name, birth, role) VALUES (%s, %s, %s);", (self.name, self.birth, self.role))
        self.db_connection.commit()
        c.close()


new_connection = Connection('dbuser', '123', 'mydb', 'localhost')
with new_connection:
    musician = Musician(new_connection, 'name', '2000-1-1', 'role')
    musician.save()


