class UsersController < ApplicationController


  def show
  	@user = User.find(params[:id])
	@posts = @user.posts.order("created_at DESC")
	@snippets = @user.snippets.order("created_at DESC")
	@goals = @user.goals.order("created_at DESC")
  end
end
