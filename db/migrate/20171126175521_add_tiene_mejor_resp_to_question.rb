class AddTieneMejorRespToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :tiene_mejor_resp, :boolean, default: false
  end
end
