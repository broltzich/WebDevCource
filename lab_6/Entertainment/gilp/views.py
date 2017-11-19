from django.shortcuts import render
import MySQLdb

# Create your views here.


class Musician:
    def __init__(self, db_connection, name=None, birth=None, gender=None, role=None,
                 group=None):
        self.db_connection = db_connection
        self.name = name
        self.birth = birth
        self.gender = gender
        self.role = role
        self.group = group

    def save(self):
        c = self.db_connection.cursor()
        c.execute("INSERT INTO games (title, developer, releaseDate) VALUES (%s, %s, %s);",
                  (self.title, self.developer, self.releaseDate))
        self.db_connection.commit()
        c.close()