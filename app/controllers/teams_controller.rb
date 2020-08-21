class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    
    if @team.save
      redirect_to teams_new_path
    end
    
  end

  def destroy
  end

  private
  def team_params
    binding.pry
    params.require(:team).permit(:name)
  end

end
