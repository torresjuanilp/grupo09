class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :stng
    add_column :users, :apellido, :string
    add_column :users, :facultad, :string
  end
end
