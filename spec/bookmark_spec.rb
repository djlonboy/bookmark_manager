require 'bookmark'
describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include "www.google.co.uk"
      expect(bookmarks).to include  "www.bbc.co.uk"
      expect(bookmarks).to include  "www.makersacademy.com"
    end
  end
end
