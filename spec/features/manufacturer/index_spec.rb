require 'rails_helper'
=begin
[✔️] done

User Story 1, Parent Index 

For each parent table
As a visitor
When I visit '/parents'
Then I see the name of each parent record in the system

[🪩] done

User Story 6, Parent Index sorted by Most Recently Created 

As a visitor
When I visit the parent index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created

[🍕] done

User Story 9, Parent Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Parent Index

[😱] done

User Story 11, Parent Creation 

As a visitor
When I visit the Parent Index page
Then I see a link to create a new Parent record, "New Parent"
When I click this link
Then I am taken to '/parents/new' where I  see a form for a new parent record
When I fill out the form with a new parent's attributes:
And I click the button "Create Parent" to submit the form
Then a `POST` request is sent to the '/parents' route,
a new parent record is created,
and I am redirected to the Parent Index page where I see the new Parent displayed.

[💡] done

User Story 17, Parent Update From Parent Index Page 

As a visitor
When I visit the parent index page
Next to every parent, I see a link to edit that parent's info
When I click the link
I should be taken to that parent's edit page where I can update its information just like in User Story 12
=end

RSpec.describe 'The Manufacturer', type: :feature do
  describe "#index page" do
    it 'displays the name of each manufacturer' do

      visit "/manufacturers"
      
      expect(page).to have_content(@dahl.name)
      expect(page).to have_content(@jakobs.name)
      expect(page).to have_content(@maliwan.name)
      expect(page).to have_content(@torgue.name)

      expect(page).to_not have_content(@torgue.headquarters)
    end

    
    it 'orders the display of names by most recent created' do
      hyperion = Manufacturer.create!(name: "Hyperion", headquarters: "Helios", elemental?: true, equipment_production_total: 10392844)
      hyperion.created_at = Time.zone.parse('2023-07-08 10:30:00')
      
      dahl = Manufacturer.create!(name: "Dahl", headquarters: "Unknown", elemental?: true, equipment_production_total: 752005)
      dahl.created_at = Time.zone.parse('2023-07-07 10:30:00')

      visit "/manufacturers"

      expect(page.text.index(dahl.name)).to be < page.text.index(hyperion.name)
    end

    it 'has global Manufacturer Index link available on all pages on site' do

      visit "/manufacturers"
      expect(page).to have_link("Manufacturers Index", href: "/manufacturers")
      
      visit "/weapons"
      expect(page).to have_link("Manufacturers Index", href: "/manufacturers")

      visit "/weapons/#{@maliwan.weapons.first.id}"
      expect(page).to have_link("Manufacturers Index", href: "/manufacturers")
    end

    it 'displays a link that take users to a form to create new Manufacturer' do

      visit "/manufacturers"

      click_link "New Manufacturer"

      fill_in "manufacturer[name]", with: "Hyperion"
      fill_in "manufacturer[headquarters]", with: "Helios"
      choose "manufacturer[elemental?]", option: "true"
      fill_in "Equipment Production Total", with: 10392844
      click_button "Submit"
      
      expect(page.text).to have_content("Hyperion")
    end

    it 'display a Edit link that takes the user to the Manufacturer edit form' do
      
      visit "/manufacturers"

      expect(page).to have_link("Edit")
    end
  end
end