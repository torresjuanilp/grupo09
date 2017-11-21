class AddSlugToQuestions < ActiveRecord::Migration[5.1.4]
  def change
    add_column :questions, :slug, :string
  end
end
