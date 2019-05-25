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
    def __init__(self, db_connection, name=None, birth=None, role=None):
        self.db_connection = db_connection.connection
        self.name = name
        self.birth = birth
        self.role = role

    def save(self):
        c = self.db_connection.cursor()
        c.execute("INSERT INTO musician (name, birth, role) VALUES (%s, %s, %s);", (self.name, self.birth, self.role))
        self.db_connection.commit()
        c.close()

    def edit(self, selected_name):
        c = self.db_connection.cursor()
        c.execute("UPDATE musician SET name = %s, birth = %s, role = %s WHERE name = %s;",
                  (self.name, self.birth, self.role, selected_name))
        self.db_connection.commit()
        c.close()


new_connection = Connection('dbuser', '123', 'mydb', 'localhost')
choice = input('[add]/[edit]: ')
if choice == 'add':
    m_name = input('name: ')
    m_birth = input('birth (yyy-mm-dd): ')
    m_role = input('role: ')
    ans = input('Save [y/n]: ')
    if ans == 'y':
        with new_connection:
            musician = Musician(new_connection, m_name, m_birth, m_role)
            musician.save()
    else:
        pass
elif choice == 'edit':
    selected_name = input('musician name to edit: ')
    new_name = input('new name: ')
    new_birth = input('new birth (yyy-mm-dd): ')
    new_role = input('new role: ')
    ans = input('Save [y/n]: ')
    if ans == 'y':
        with new_connection:
            musician = Musician(new_connection, new_name, new_birth, new_role)
            musician.edit(selected_name)
    else:
        pass
