class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :apellido, :string
    add_column :users, :faculty_id, :integer
  end
end
