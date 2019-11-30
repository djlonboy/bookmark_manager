require 'bookmark'
require 'features/web_helper'

describe Bookmark do
  before (:each) do
    setup_table
  end

  describe '.all' do
    it 'returns all instances of bookmarks class' do
      bookmarks = Bookmark.all
      expect(bookmarks.count).to eq 3
      expect(bookmarks[0].title).to eq "Makers Academy"
      expect(bookmarks[0].url).to eq "http://www.makersacademy.com"
      expect(bookmarks[0].id).to eq "1"
    end
  end

  describe '.add' do
    it 'can add a bookmark' do
      Bookmark.add("www.test.com", "Test Website")
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec("SELECT * FROM bookmarks")
      resulthash = result.map { |line| line }
      expect(resulthash[3]["url"]).to eq "www.test.com"
      expect(resulthash[3]["title"]).to eq "Test Website"
    end
  end
end
