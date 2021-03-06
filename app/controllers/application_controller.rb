require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
    use Rack::Flash
  end

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      User.find(session[:id])
    end

    def logged_in?
      !!(session[:id])
    end
  end

end
