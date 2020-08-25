class UsersController < ApplicationController
  before_action { :authenticate_user! || :authenticate_boss!}
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # binding.pry
    @parent_tasks=ParentTask.where(user_id: @user.id)
    # binding.pry
  end
end
