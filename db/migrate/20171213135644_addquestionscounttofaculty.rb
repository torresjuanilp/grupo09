class Addquestionscounttofaculty < ActiveRecord::Migration[5.1]
  def change
  	add_column :faculties, :questions_count, :integer, default: 0
  end
end
