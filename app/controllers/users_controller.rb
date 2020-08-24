class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @parent_tasks=ParentTask.where(user_id: @user.id)
    # binding.pry
  end
end
