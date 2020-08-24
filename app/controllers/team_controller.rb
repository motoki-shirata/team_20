class TeamController < ApplicationController
  before_action { :authenticate_user! || :authenticate_boss!}

  def index
    @teams = current_boss.teams
  end

  def show
    current_boss.teams.each do |team|
      team.id
      binding.pry
    end
  end
end
