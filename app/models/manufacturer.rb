class Manufacturer < ApplicationRecord
  has_many :weapons, dependent: :destroy
end