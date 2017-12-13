class AddQuestionCountToCategories < ActiveRecord::Migration[5.1]
  def change
 
<<<<<<< HEAD
    add_column :categories, :questions_count, :integer, default: 0
=======
    add_column :categories, :question_count, :integer, default: 0
>>>>>>> edf7f3460f101d7c7711d607d0b191742c81b263
  
  end
end
