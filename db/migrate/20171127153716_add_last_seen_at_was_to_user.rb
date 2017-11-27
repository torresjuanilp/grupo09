class AddLastSeenAtWasToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_seen_at_was, :datetime
  end
end
