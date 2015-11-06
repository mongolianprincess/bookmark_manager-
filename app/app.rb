ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/link'
require_relative 'models/user'

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
    params[:tag].split.each do |x|
      link.tags << Tag.create(:name => x)
    end
    link.save
    redirect('/links/index')
  end

  get '/tags/:name' do
    filter = Tag.all(name: params[:name])
    @links = filter ? filter.links : []
    erb(:'links/index')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
