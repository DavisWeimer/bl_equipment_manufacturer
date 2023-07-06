class CreateManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :headquarters
      t.boolean :elemental?
      t.integer :equipment_production_total

      t.timestamps
    end
  end
end
