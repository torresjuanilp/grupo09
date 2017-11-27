class AddMejorRespToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :mejor_resp, :boolean , default: false
  end
end
