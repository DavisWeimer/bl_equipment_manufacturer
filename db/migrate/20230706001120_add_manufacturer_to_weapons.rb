class AddManufacturerToWeapons < ActiveRecord::Migration[7.0]
  def change
    add_reference :weapons, :manufacturer, null: false, foreign_key: true
  end
end
