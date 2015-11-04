require 'sinatra/base'
require_relative 'models/link'

ENV["RACK_ENV"] ||= "development"

class BookmarkManager < Sinatra::Base

  # set :views, proc {File.join(root, '..', 'views')}

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links/index' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    Link.create(:url => (params[:url]), :title => (params[:title]))
    redirect('/links/index')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
