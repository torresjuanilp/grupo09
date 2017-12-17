class AddQuestionVotesToUser < ActiveRecord::Migration[5.1]
  def change
	add_column :users, :question_vote_id, :integer
  end
end
