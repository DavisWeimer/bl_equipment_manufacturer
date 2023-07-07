class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def show
    @weapons = Weapon.find(params[:id])
  end
end