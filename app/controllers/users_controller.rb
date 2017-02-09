class UsersController < ApplicationController

  get '/signup' do
    binding.pry
    if logged_in?
      redirect to "/items"
    else
      erb :"/users/create_user"
    end
  end

  post '/signup' do
    if params["username"] != "" && params["email"] != "" && params["password"] != ""
      @user = User.create(username: params["username"], email: params["email"], password: params["password"])
      session[:id] = @user.id
      redirect to "/items"
    else
      redirect to "/signup"
    end
  end

end
