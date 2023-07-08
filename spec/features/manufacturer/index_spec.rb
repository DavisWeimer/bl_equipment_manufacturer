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

      visit "/manufacturers"

      expect(page).to have_content(@dahl.name)
      expect(page).to have_content(@dahl.created_at)
      expect(page).to have_content(@jakobs.name)
      expect(page).to have_content(@jakobs.created_at)
      expect(page).to have_content(@maliwan.name)
      expect(page).to have_content(@maliwan.created_at)
      expect(page).to have_content(@torgue.name)
      expect(page).to have_content(@torgue.created_at)
      
      expect(page).to_not have_content(@torgue.headquarters)
    end
  end
end