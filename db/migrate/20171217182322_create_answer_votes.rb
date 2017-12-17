class CreateAnswerVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_votes do |t|
      t.integer :user_id
      t.integer :answer_id
      t.boolean :positive

      t.timestamps
    end
	add_column :users, :answer_vote_id, :integer
	add_column :answers, :answer_vote_id, :integer
  end
end
