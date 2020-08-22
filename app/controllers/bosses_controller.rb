class BossesController < ApplicationController
  def index
    @bosses = Boss.all
  end

  def show
    @boss = Boss.find(params[:id])
  end
end
