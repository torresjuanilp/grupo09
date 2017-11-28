class AddUserToPermit < ActiveRecord::Migration[5.1]
  def change
	add_column :permits, :user_id, :integer
  end
end
