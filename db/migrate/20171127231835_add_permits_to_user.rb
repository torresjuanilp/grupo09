class AddPermitsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :permit_id, :integer
  end
end
