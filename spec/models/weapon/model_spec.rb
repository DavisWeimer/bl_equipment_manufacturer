require 'rails_helper'

RSpec.describe Weapon, type: :model do
  describe "#exists and belongs to a Manufacturer" do
    it {should belong_to :manufacturer} 
  end
end