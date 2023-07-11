require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  describe "#exists and can have weapons" do
    it {should have_many :weapons} 
  end
end