class BossesController < ApplicationController
  before_action { :authenticate_user! || :authenticate_boss!}
  def index
    @bosses = Boss.all
  end

  def show
    @boss=Boss.find(params[:id])
  end


  def update
    # binding.pry
    if current_boss.id != params[:id].to_i
      redirect_to boss_path
    else
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
      redirect_to "/bosses/#{params[:id]}"
    end
  end

  def new_team
    @boss=Boss.find(current_boss.id)
    # @boss.organizations.build
    @teams=Team.all
  end

  def post_team
    params["boss"]["team_ids"].each do |t|
      if Organization.find_by(boss_id: current_boss.id, team_id: t)
        next
      else
        current_boss.organizations.create(team_id: t).save
      end
    end
    redirect_to :root
  end

  def boss_params
    params.require(:boss).permit(team_ids: [])
  end

end
