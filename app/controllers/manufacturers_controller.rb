class ManufacturersController < ApplicationController
  def index 
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def show_weapons
    @manufacturer = Manufacturer.find(params[:id])
    @weapons_list = @manufacturer.weapons
  end
end