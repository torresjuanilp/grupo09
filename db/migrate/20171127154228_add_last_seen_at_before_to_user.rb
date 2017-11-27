class AddLastSeenAtBeforeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_seen_at_before, :datetime
    remove_column :users, :last_seen_at_was
  end
end
