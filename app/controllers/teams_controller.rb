class TeamsController < ApplicationController

  def new
    # @team = Team.where(team_params)
    @organization = Organization.new(team_params)
  end

  def create
    # binding.pry
    # @team = Team.new(team_params)
    @team = Team.where(team_params)
  end

  def destroy
  end

  private
  def team_params
    # binding.pry
    params.permit(boss_ids:[])
  end

end
