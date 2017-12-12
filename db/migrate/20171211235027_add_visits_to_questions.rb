class AddVisitsToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :visits_count, :integer, default: 0
  end
end
