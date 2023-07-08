require 'rails_helper'
=begin
[✔️] done

User Story 3, Child Index 

As a visitor
When I visit '/child_table_name'
Then I see each Child in the system including the Child's attributes
(data from each column that is on the child table)

[🎱] done

User Story 8, Child Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Child Index
=end

RSpec.describe 'The Weapon', type: :feature do
  describe '#index page' do
    it 'displays the names of all the weapons' do

      visit "/weapons"

      expect(page).to have_content(@dahl.weapons.first.name)
      expect(page).to have_content(@jakobs.weapons.first.name)
      expect(page).to have_content(@maliwan.weapons.first.name)
      expect(page).to have_content(@torgue.weapons.first.name)
      
      expect(page).to_not have_content(@torgue.weapons.first.accuracy)
    end

    it 'has global Weapons Index link available on all pages on site' do

      visit "/weapons"
      expect(page).to have_link("Weapons Index", href: "/weapons")
      
      visit "/manufacturers"
      expect(page).to have_link("Weapons Index", href: "/weapons")

      visit "/manufacturers/#{@jakobs.id}/weapons"
      expect(page).to have_link("Weapons Index", href: "/weapons")

    end
  end
end