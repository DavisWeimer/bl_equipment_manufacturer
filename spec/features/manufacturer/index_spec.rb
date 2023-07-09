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
  end
end