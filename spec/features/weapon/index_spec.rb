require 'rails_helper'
=begin
[✔️] done

User Story 3, Child Index 

As a visitor
When I visit '/child_table_name'
Then I see each Child in the system including the Child's attributes
(data from each column that is on the child table)
=end
RSpec.describe 'The weapons index page' do
  it 'displays the names of all the weapons' do

    visit "/weapons"

    expect(page).to have_content(@dahl.weapons.first.name)
    expect(page).to have_content(@jakobs.weapons.first.name)
    expect(page).to have_content(@maliwan.weapons.first.name)
    expect(page).to have_content(@torgue.weapons.first.name)
    
    expect(page).to_not have_content(@torgue.weapons.first.accuracy)
  end
end