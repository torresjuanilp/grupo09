class JoinTable < ActiveRecord::Migration[5.1]
  def change
	create_table :categories_questions, :id => false do |f|
     f.integer :category_id, :question_id
end
  end
end
