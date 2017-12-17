class AddPositiveToQuestionVote < ActiveRecord::Migration[5.1]
  def change
	add_column :question_votes, :positive, :boolean
  end
end
