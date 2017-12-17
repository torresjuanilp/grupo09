class RemoveAnswersCountFromQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :answers_count, :integer
  end
end
