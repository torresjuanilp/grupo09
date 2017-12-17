class AddQuestionVotesToQuestion < ActiveRecord::Migration[5.1]
  def change
	add_column :questions, :question_vote_id, :integer
  end
end
