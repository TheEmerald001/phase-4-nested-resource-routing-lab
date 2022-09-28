class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else
    items = Item.all
    end    
    render json: items, include: :user
  end

  def show
    if params[:user_id]
      user = User.find(params[:user_id])
      item = user.items.find(params[:id])      
    else
      item = Item.find(params[:id])
    end
    render json: item, include: :user
  end

  def create
    if params[:user_id]
      user = User.find(params[:user_id])
      item = user.items.create(params[:item])
      return render json: item, include: :user
    else
      render json: {error: 'not_found'}
    end
  end
end
