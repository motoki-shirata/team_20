class BossesController < ApplicationController
  before_action :authenticate_boss!
  def index
    @bosses = Boss.all
  end

  def show
    @boss=Boss.find(current_boss.id)
  end


  def update
    # binding.pry
    current_boss.organizations.each do |organization|
      organization.destroy
    end

    # binding.pry
    params["boss"]["team_ids"].each do |t|
      if Organization.find_by(boss_id: current_boss.id, team_id: t)
        next
      else
        current_boss.organizations.create(team_id: t).save
      end
    end
    redirect_to :root
  end

  def new_team
    @boss=Boss.find(current_boss.id)
    # @boss.organizations.build
    @teams=Team.all
    # @organizaions.new(organization_params)
    # binding.pry
    # @organizations.where(boss_id: current_boss.id)
    # if @organizations.save
    #   redirect_to root_path
    # else
    #   redirect_to :back
    # end
  end

  def post_team
    params["boss"]["team_ids"].each do |t|
      if Organization.find_by(boss_id: current_boss.id, team_id: t)
        next
      else
        current_boss.organizations.create(team_id: t).save
      end
    end
    # binding.pry
    # Organization.create(boss_id: current_boss.id, team_id: [1,2])
    redirect_to :root
  end

  def boss_params
    params.require(:boss).permit(team_ids: [])
  end

  # def organization_params
  #   params.require(:organization).permit(boss_id: [], team_id: [])
  # end

end
