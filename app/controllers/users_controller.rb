class UsersController < ApplicationController


  def show
  	@user = User.find(params[:id]).order("name ASC")
	@posts = @user.posts.order("created_at DESC")
	@snippets = @user.snippets.order("created_at DESC")
	@goals = @user.goals.order("created_at DESC")
	@user
  end
end
