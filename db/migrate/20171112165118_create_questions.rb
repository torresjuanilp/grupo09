class CreateQuestions < ActiveRecord::Migration[5.1.4]
  def change
    create_table :questions do |t|
      t.string :titulo
      t.string :descripcion
      t.integer :user_id

      t.timestamps
    end
  end
end
