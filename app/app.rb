ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/users/new' do
    erb(:'users/user')
  end
  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])

    session[:user_id] = user.id
    redirect('/links/index')
  end

  get '/links/index' do
    @links = Link.all
    p current_user
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

  helpers do
    def current_user
        @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
