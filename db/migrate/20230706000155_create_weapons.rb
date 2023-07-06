class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.integer :level_req
      t.string :rarity
      t.string :type
      t.string :name
      t.integer :damage
      t.float :accuracy
      t.float :fire_rate
      t.float :reload_speed
      t.integer :magazine_size
      t.boolean :elemental?
      t.string :elemental_type
      t.string :trait
      t.integer :price

      t.timestamps
    end
  end
end
