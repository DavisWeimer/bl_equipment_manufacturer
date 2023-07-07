require 'rails_helper'
=begin
[✔️] done

User Story 1, Parent Index 

For each parent table
As a visitor
When I visit '/parents'
Then I see the name of each parent record in the system
=end
RSpec.describe 'The manufacturers index page' do
  it 'displays the name of each manufacturer' do

    visit "/manufacturers"
    
    expect(page).to have_content(@dahl.name)
    expect(page).to have_content(@jakobs.name)
    expect(page).to have_content(@maliwan.name)
    expect(page).to have_content(@torgue.name)
    expect(page).to_not have_content(@torgue.headquarters)
  end
end