require 'bookmark'
require 'features/web_helper'

describe Bookmark do
  before (:each) do
    setup_table
  end

  describe '.all' do
    it 'returns all bookmarks' do

      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://google.com"
      expect(bookmarks).to include "www.bbc.co.uk"
      expect(bookmarks).to include "http://www.makersacademy.com"
    end
  end

  describe '.add' do
    it 'can add a bookmark' do
      Bookmark.add("www.test.com", "Test Website")
      expect(Bookmark.all).to include "www.test.com"
      expect(Bookmark.all).to include "Test Website"
    end
  end
end
