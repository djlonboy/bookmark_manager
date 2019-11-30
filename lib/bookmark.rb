require 'pg'


class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, title, url)
    @id = id
    @url = url
    @title = title
  end

  def self.all

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks')
    result.map do |row|
      Bookmark.new(row['id'], row['title'], row['url'])
    end
      #{ |bookmark| bookmark['url'].to_s + " - " + bookmark['title'].to_s }

  end

  def self.add(url, title)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}')")

  end
end
