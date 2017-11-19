import MySQLdb


class Connection:
    def __init__(self, user, passw, db, host='localhost'):
        self.user = user
        self.host = host
        self.passw = passw
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
                passwd=self.passw,
                db=self.db
            )

    def disconnect(self):
        if self._connection:
            self._connection.close()
