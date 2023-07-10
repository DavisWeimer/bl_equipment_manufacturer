require 'rails_helper'
=begin
[✖️] done

User Story 5, Parent Children Index 

As a visitor
When I visit '/parents/:parent_id/child_table_name'
Then I see each Child that is associated with that Parent with each Child's attributes
(data from each column that is on the child table)

[⚛️] done

User Story 13, Parent Child Creation 

As a visitor
When I visit a Parent Children Index page
Then I see a link to add a new adoptable child for that parent "Create Child"
When I click the link
I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
When I fill in the form with the child's attributes:
And I click the button "Create Child"
Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
a new child object/row is created for that parent,
and I am redirected to the Parent Childs Index page where I can see the new child listed
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

  it 'displays a link on the Manufacturer Weapons page to create a new Weapon' do

    visit "/manufacturers/#{@torgue.id}/weapons"

    click_link "Add weapon"

    select 60, from: "weapon[level_req]"
    select "Purple", from: "weapon[rarity]"
    select "Pistol", from: "weapon[weapon_type]"
    fill_in "weapon[name]", with: "Hole Puncher"
    fill_in "weapon[damage]", with: 45780
    fill_in "weapon[accuracy]", with: 91.7
    fill_in "weapon[fire_rate]", with: 2.3
    fill_in "weapon[reload_speed]", with: 1.9
    fill_in "weapon[magazine_size]", with: 13
    choose "weapon[elemental?]", option: "false"
    select "Explosive", from: "weapon[elemental_type]"
    fill_in "weapon[trait]", with: "+8% Critical Hit Damage & Deals bonus explosive damage"
    fill_in "weapon[price]", with: 79993
    click_button "Submit"

    expect(@torgue.weapons.count).to eq(2)
    expect(@torgue.weapons.last.name).to eq("Hole Puncher")
  end
end