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
end
