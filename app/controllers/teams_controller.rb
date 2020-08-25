class TeamsController < ApplicationController
  before_action { :authenticate_user! || :authenticate_boss!}

  # def index
  #   @teams = current_boss.teams
  # end

  def show
    # binding.pry
    @team=Team.find(params[:id])
    # binding.pry
  end

  # def new
  #   # @team = Team.where(team_params)
  #   @organization = Organization.new(team_params)
  # end

  # def create
  #   # binding.pry
  #   # @team = Team.new(team_params)
  #   @team = Team.where(team_params)
  # end

  # def destroy
  # end

  # private
  # def team_params
  #   # binding.pry
  #   params.permit(boss_ids:[])
  # end

end
