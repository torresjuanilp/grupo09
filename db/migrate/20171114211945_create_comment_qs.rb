class CreateCommentQs < ActiveRecord::Migration[5.1.4]
  def change
    create_table :comment_qs do |t|
      t.string :titulo
      t.string :texto
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
