require 'rails_helper'
=begin
[✔️] done

User Story 2, Parent Show 

As a visitor
When I visit '/parents/:id'
Then I see the parent with that id including the parent's attributes
(data from each column that is on the parent table)

[🪄] done

User Story 7, Parent Child Count

As a visitor
When I visit a parent's show page
I see a count of the number of children associated with this parent

[🍙] done

User Story 10, Parent Child Index Link

As a visitor
When I visit a parent show page ('/parents/:id')
Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
=end

RSpec.describe 'The Manufacturer', type: :feature  do
  describe "#show page" do
    it 'displays the manufacturer by :id and its attributes' do

      visit "/manufacturers/#{@jakobs.id}"
      
      expect(page).to have_content(@jakobs.name)
      expect(page).to have_content(@jakobs.headquarters)
      expect(page).to have_content(@jakobs.elemental?)
      expect(page).to have_content(@jakobs.equipment_production_total)

      expect(page).to_not have_content(@torgue.headquarters)
    end


    it 'displays the number of weapons per manufacturer' do

      visit "/manufacturers/#{@dahl.id}"

      expect(page).to have_content(@dahl.weapons.count)

      expect(page).to_not have_content(@torgue.weapons.count)
    end

    it 'displays a link to Manufacturers Weapons page' do

      visit "/manufacturers/#{@maliwan.id}"
      
      expect(page).to have_link("#{@maliwan.name} Weapons", href: "/manufacturers/#{@maliwan.id}/weapons")
    end
  end
end