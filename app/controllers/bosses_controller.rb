class BossesController < ApplicationController
  before_action :authenticate_boss!
  def index
    @bosses = Boss.all
  end

  def show
    @boss=Boss.where(id: current_boss.id)
  end

  def new_team
    @boss=Boss.where(id: current_boss.id)
    # @boss.organizations.build
    @teams=Team.all
  end

  def post_team
    @boss=Boss.where(id: current_boss.id)
  end

  def boss_params
    params.require(:boss).permit(team_ids: [])
  end


end
