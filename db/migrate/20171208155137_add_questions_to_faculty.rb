class AddQuestionsToFaculty < ActiveRecord::Migration[5.1]
  def change
	add_column :faculties, :question_id, :integer
  end
end
