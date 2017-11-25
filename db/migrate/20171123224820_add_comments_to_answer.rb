class AddCommentsToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :comment_id, :integer
  end
end
