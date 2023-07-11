require 'rails_helper'
=begin
[💲] done

User Story 4, Child Show 

As a visitor
When I visit '/child_table_name/:id'
Then I see the child with that id including the child's attributes
(data from each column that is on the child table)

[📍] done

User Story 14, Child Update 

As a visitor
When I visit a Child Show page
Then I see a link to update that Child "Update Child"
When I click the link
I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
When I click the button to submit the form "Update Child"
Then a `PATCH` request is sent to '/child_table_name/:id',
the child's data is updated,
and I am redirected to the Child Show page where I see the Child's updated information
=end
RSpec.describe 'The Weapon', type: :feature do
  describe '#show page' do
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

    it 'displays a link that takes user to an update form for current Weapon' do

      visit "/weapons/#{@torgue.weapons.first.id}"

      click_link "Edit details"
      select "Sniper Rifle", from: "weapon[weapon_type]"
      choose "weapon[elemental?]", option: "false"
      click_button "Submit"

      expect(@torgue.weapons.first.weapon_type).to eq("Sniper Rifle") 
      expect(@torgue.weapons.first.elemental?).to eq(false) 
    end

    it 'displays a button to Delete Weapon' do
      
      visit "/weapons/#{@maliwan.weapons.first.id}"

      expect(@maliwan.weapons.first.name).to eq("Impetuous Plasma Caster")

      click_button "Delete"
      
      expect(@maliwan.weapons.first.name).to_not eq("Impetuous Plasma Caster")
    end
  end
end