class CreateManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :headquarters
      t.boolean :elemental?
      t.integer :num_of_games_appeared_in

      t.timestamps
    end
  end
end
