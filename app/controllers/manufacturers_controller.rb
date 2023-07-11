class ManufacturersController < ApplicationController
  def index 
    @manufacturers = Manufacturer.all
    @manufacturers_sorted = @manufacturers.order(:created_at)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def show_weapons
    @manufacturer = Manufacturer.find(params[:id])
    @weapons_list = @manufacturer.weapons.order(:name)
  end

  def new; end
  
  def form_to_boolean?(form_attr)
    form_attr == "true"
    # if object.elemental? == "true"
    #   object.update({
    #     elemental?: params[:manufacturer][:elemental?] = true
    #   })
    # else object.elemental? == "false"
    #   object.update({
    #     elemental?: params[:manufacturer][:elemental?] = false
    #   })
    # end
  end

  def create
    manufacturer = Manufacturer.new({
      name: params[:manufacturer][:name],
      headquarters: params[:manufacturer][:headquarters],
      elemental?: params[:manufacturer][:elemental?],
      equipment_production_total: params[:manufacturer][:equipment_production_total]
    })
    form_to_boolean?(manufacturer.elemental?)
    manufacturer.save
    redirect_to '/manufacturers'
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.update({
      name: params[:manufacturer][:name],
      headquarters: params[:manufacturer][:headquarters],
      elemental?: params[:manufacturer][:elemental?],
      equipment_production_total: params[:manufacturer][:equipment_production_total]
    })
    form_to_boolean?(manufacturer.elemental?)
    manufacturer.save
    redirect_to "/manufacturers/#{manufacturer.id}"
  end

  def destroy
    Manufacturer.destroy(params[:id])
    redirect_to "/manufacturers"
  end
end