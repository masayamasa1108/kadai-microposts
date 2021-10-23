class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    current_user.favorite(Micropost.find(params[:micropost_id]))
    flash[:success] = 'micropostをお気に入りにしました。'
    redirect_back fallback_location: root_url
  end

  def destroy
    current_user.unfavorite(Micropost.find(params[:micropost_id]))
    flash[:success] = 'micropostのお気に入りを解除しました。'
    redirect_back fallback_location: root_url
  end
end
