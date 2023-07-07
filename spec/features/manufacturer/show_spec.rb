require 'rails_helper'
=begin
[✔️] done

User Story 2, Parent Show 

As a visitor
When I visit '/parents/:id'
Then I see the parent with that id including the parent's attributes
(data from each column that is on the parent table)
=end
RSpec.describe 'The manufacturers show page' do
  it 'displays the manufacturer by :id and its attributes' do

    visit "/manufacturers/#{@jakobs.id}"
    
    expect(page).to have_content(@jakobs.name)
    expect(page).to have_content(@jakobs.headquarters)
    expect(page).to have_content(@jakobs.elemental?)
    expect(page).to have_content(@jakobs.equipment_production_total)
    expect(page).to_not have_content(@torgue.headquarters)
  end
end