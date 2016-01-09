class UsersController < ApplicationController
  def index
    @posts = current_user.fb_posts if current_user
  end
end
