require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class BookmarkManager < Sinatra::Base

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
    link = Link.create(:url => (params[:url]), :title => (params[:title]))
    tag = Tag.create(:name => (params[:tag]))
    link.tags << tag
    link.save
    redirect('/links/index')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
