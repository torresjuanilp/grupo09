class AddCategoryColToQuestion < ActiveRecord::Migration[5.1]
  def change
	add_column :questions, :category, :Category
  end
end
