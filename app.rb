require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
   erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/add-bookmark' do
    erb :add_bookmark
  end

  post '/post-bookmark' do
    Bookmark.add(params[:url], params[:title])
    redirect('/bookmarks')
  end

 run! if app_file == $0
end
