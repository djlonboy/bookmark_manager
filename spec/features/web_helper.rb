require './app'
require 'pg'

def setup_table
connection = PG.connect(dbname: 'bookmark_manager_test')
connection.exec('DROP TABLE IF EXISTS bookmarks;')
connection.exec('CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));')
connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.makersacademy.com', 'Makers Academy');")
connection.exec("INSERT INTO bookmarks(url, title) VALUES('https://www.bbc.co.uk', 'BBC');")
connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://google.com', 'Google');")
end
