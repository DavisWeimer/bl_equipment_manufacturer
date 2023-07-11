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

[🧦] done

User Story 12, Parent Update 

As a visitor
When I visit a parent show page
Then I see a link to update the parent "Update Parent"
When I click the link "Update Parent"
Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/parents/:id',
the parent's info is updated,
and I am redirected to the Parent's Show page where I see the parent's updated info

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


    it 'displays a link that takes user to an update form for current Manufacturer' do

      visit "/manufacturers/#{@torgue.id}"

      click_link "Edit details"

      fill_in "manufacturer[headquarters]", with: "THIS IS A TEST OF THE LOCATION"
      choose "manufacturer[elemental?]", option: "false"
      click_button "Submit"

      @torgue.reload #lol that keyword works well

      expect(@torgue.headquarters).to eq("THIS IS A TEST OF THE LOCATION")
      expect(@torgue.elemental?).to eq(false)
    end

    it 'displays a button to Delete Manufacturer and all associated Weapons' do

      visit "/manufacturers/#{@maliwan.id}"
      
      expect(page).to have_text("Maliwan")

      click_button "Delete"

      expect(page).to_not have_text("Maliwan")
    end
  end
end