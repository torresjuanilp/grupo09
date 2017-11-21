class CommentTable < ActiveRecord::Migration[5.1.4]
  def change
	 create_table "comments", force: :cascade do |t|
		t.string "titulo"
		t.string "texto"
		t.integer "user_id"
		t.integer "question_id"
		t.datetime "created_at", null: false
		t.datetime "updated_at", null: false
	 end
  end
end
