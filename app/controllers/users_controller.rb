class UsersController < ApplicationController
  def index
    if current_user
      @posts = current_user.fb_posts(params[:page])
    end
  end
end
