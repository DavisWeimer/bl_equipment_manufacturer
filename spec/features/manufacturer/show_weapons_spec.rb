require 'rails_helper'
=begin
[✖️] done

User Story 5, Parent Children Index 

As a visitor
When I visit '/parents/:parent_id/child_table_name'
Then I see each Child that is associated with that Parent with each Child's attributes
(data from each column that is on the child table)
=end
RSpec.describe 'The manufacturers #show_weapons page' do
  it 'displays the weapons associated w/ the manufacturer :id' do

    visit "/manufacturers/#{@torgue.id}/weapons"

    expect(page).to have_content(@torgue.weapons.first.name)
    expect(page).to have_content(@torgue.weapons.first.level_req)
    expect(page).to have_content(@torgue.weapons.first.rarity)
    expect(page).to have_content(@torgue.weapons.first.weapon_type)
    expect(page).to have_content(@torgue.weapons.first.damage)
    expect(page).to have_content(@torgue.weapons.first.accuracy)
    expect(page).to have_content(@torgue.weapons.first.fire_rate)
    expect(page).to have_content(@torgue.weapons.first.reload_speed)
    expect(page).to have_content(@torgue.weapons.first.magazine_size)
    expect(page).to have_content(@torgue.weapons.first.elemental?)
    expect(page).to have_content(@torgue.weapons.first.elemental_type)
    expect(page).to have_content(@torgue.weapons.first.trait)
    expect(page).to have_content(@torgue.weapons.first.price)
    
    expect(page).to_not have_content(@maliwan.weapons.first.name)
  end
end