require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require_relative 'database_connection_setup'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  get '/' do
    DatabaseConnection.wrap_database
    @links = Link.all
    erb(:index)
  end

  post '/add_link' do
    @new_link = params[:url]
    if Link.valid_url?(@new_link)
      Link.add(@new_link)
      redirect '/'
    else
      flash[:warning] = 'This is not a valid URL'
      redirect '/'
    end
  end

end
