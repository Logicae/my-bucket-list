class ItemsController < ApplicationController

  get '/items/new' do
    if logged_in?
      erb :"items/create_item"
    else
      redirect to "/login"
    end
  end

  get '/items' do
    if logged_in?
      @user = current_user
      erb :"items/items"
    else
      redirect to "/login"
    end
  end

  post '/items' do
    if params[:title] == "" || params[:content] == ""
      redirect to "/items/new"
    else
      @item = Item.create(params)
      @user = current_user
      @user.items << @item
      redirect to "/items/#{@item.id}"
    end
  end

  get '/items/:id' do
    if logged_in?
      @item = Item.find(params[:id])
      erb :"items/show_item"
    else
      redirect to "/login"
    end
  end
end
