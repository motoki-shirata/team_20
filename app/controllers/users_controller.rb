class UsersController < ApplicationController
  before_action { :authenticate_user! || :authenticate_boss!}
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @parent_tasks=ParentTask.where(user_id: @user.id).order(parent_deadline: "ASC")
    # binding.pry
  end
end
