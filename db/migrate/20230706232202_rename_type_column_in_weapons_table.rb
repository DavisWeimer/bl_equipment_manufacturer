class RenameTypeColumnInWeaponsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :weapons, :type, :weapon_type
  end
end
