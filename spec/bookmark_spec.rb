require 'bookmark'
require 'features/web_helper'

describe Bookmark do
  before (:each) do
    setup_table
  end

  describe '.all' do
    it 'returns all bookmarks' do

      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://google.com - Google"
      expect(bookmarks).to include "www.bbc.co.uk - BBC"
      expect(bookmarks).to include "http://www.makersacademy.com - Makers Academy"
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
