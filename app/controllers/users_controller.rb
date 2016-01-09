class UsersController < ApplicationController
  def index
    @posts = current_user.fb_posts(params[:page]) if current_user
  end
end
