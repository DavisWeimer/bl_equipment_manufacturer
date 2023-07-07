require 'rails_helper'
=begin
[💲] done

User Story 4, Child Show 

As a visitor
When I visit '/child_table_name/:id'
Then I see the child with that id including the child's attributes
(data from each column that is on the child table)
=end
RSpec.describe 'The weapons show page' do
  it 'displays the weapon by :id and its attributes' do

    visit "weapons/#{@maliwan.weapons.first.id}"
    
    expect(page).to have_content(@maliwan.weapons.first.name)
    expect(page).to have_content(@maliwan.weapons.first.level_req)
    expect(page).to have_content(@maliwan.weapons.first.rarity)
    expect(page).to have_content(@maliwan.weapons.first.weapon_type)
    expect(page).to have_content(@maliwan.weapons.first.damage)
    expect(page).to have_content(@maliwan.weapons.first.accuracy)
    expect(page).to have_content(@maliwan.weapons.first.fire_rate)
    expect(page).to have_content(@maliwan.weapons.first.reload_speed)
    expect(page).to have_content(@maliwan.weapons.first.magazine_size)
    expect(page).to have_content(@maliwan.weapons.first.elemental?)
    expect(page).to have_content(@maliwan.weapons.first.elemental_type)
    expect(page).to have_content(@maliwan.weapons.first.trait)
    expect(page).to have_content(@maliwan.weapons.first.price)
    
    expect(page).to_not have_content(@maliwan.weapons.first.created_at)
  end
end