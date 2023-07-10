class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def show
    @weapon = Weapon.find(params[:id])
  end

  def new 
    @manufacturer = Manufacturer.find(params[:id])
  end
  
  def form_to_boolean?(form_attr)
    form_attr == "true"
  end

  def create
    @manufacturer = Manufacturer.find(params[:id])

    weapon = @manufacturer.weapons.new({
      level_req: params[:weapon][:level_req],
      rarity: params[:weapon][:rarity],
      weapon_type: params[:weapon][:weapon_type],
      name: params[:weapon][:name],
      damage: params[:weapon][:damage],
      accuracy: params[:weapon][:accuracy],
      fire_rate: params[:weapon][:fire_rate],
      reload_speed: params[:weapon][:reload_speed],
      magazine_size: params[:weapon][:magazine_size],
      elemental?: params[:weapon][:elemental?],
      elemental_type: params[:weapon][:elemental_type],
      trait: params[:weapon][:trait],
      price: params[:weapon][:price]
    })
    form_to_boolean?(weapon.elemental?)
    weapon.save
    redirect_to "/manufacturers/#{@manufacturer.id}/weapons"
  end

  def edit
    @weapon = Weapon.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    weapon = Weapon.find(params[:id])

    weapon.update({
      level_req: params[:weapon][:level_req],
      rarity: params[:weapon][:rarity],
      weapon_type: params[:weapon][:weapon_type],
      name: params[:weapon][:name],
      damage: params[:weapon][:damage],
      accuracy: params[:weapon][:accuracy],
      fire_rate: params[:weapon][:fire_rate],
      reload_speed: params[:weapon][:reload_speed],
      magazine_size: params[:weapon][:magazine_size],
      elemental?: params[:weapon][:elemental?],
      elemental_type: params[:weapon][:elemental_type],
      trait: params[:weapon][:trait],
      price: params[:weapon][:price]
    })
    form_to_boolean?(weapon.elemental?)
    weapon.save
    redirect_to "/weapons/#{weapon.id}"
  end
end