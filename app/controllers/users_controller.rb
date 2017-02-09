class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to "/items"
    else
      erb :"users/create_user"
    end
  end

  post '/signup' do
    @user = User.create(username: params["username"], email: params["email"], password: params["password"])
    if @user.save
      session[:id] = @user.id
      redirect to "/items"
    else
      redirect to "/signup"
    end
  end

  get '/login' do
    if !logged_in?
      erb :"users/login"
    else
      redirect to "/items"
    end
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
    if @user && @user.authenticate(params["password"])
      session[:id] = @user.id
      redirect to "/items"
    else
      redirect to "/signup"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
    end
    redirect to "/login"
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if logged_in? && current_user.id == @user.id
      erb :"items/items"
    else
      redirect to "/login"
    end
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    if logged_in? && @item.user_id == current_user.id
      erb :"items/edit_item"
    else
      redirect to "/login"
    end
  end

  patch '/items/:id/edit' do
    @item = Item.find(params[:id])
    @item.title = params[:title]
    @Item.content = params[:content]
    @item.save
  end

  delete '/items/:id/delete' do
    @item = Item.find(params[:id])
    if logged_in? && @item.user_id == current_user.id
      @item.delete
    end
      redirect to '/items'
  end

end
