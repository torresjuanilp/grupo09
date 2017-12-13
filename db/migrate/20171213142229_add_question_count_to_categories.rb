class AddQuestionCountToCategories < ActiveRecord::Migration[5.1]
  def change
 
    add_column :categories, :questions_count, :integer, default: 0
  
  end
end
