class AddCCategId < ActiveRecord::Migration[5.1.4]
  def change
	add_column :questions, :category_id, :integer
	remove_column :questions, :categorias, :integer
  end
end
