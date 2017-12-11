class AddEnabledToPermit < ActiveRecord::Migration[5.1]
  def change
	add_column :permits, :enabled, :boolean
  end
end
