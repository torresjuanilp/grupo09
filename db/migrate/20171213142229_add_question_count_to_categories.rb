class AddQuestionCountToCategories < ActiveRecord::Migration[5.1]
  def change
 
    add_column :categories, :question_count, :integer, default: 0

  end
end
