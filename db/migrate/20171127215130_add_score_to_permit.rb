class AddScoreToPermit < ActiveRecord::Migration[5.1]
  def change
    add_column :permits, :score, :integer
  end
end
