class AddPuntajeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :puntaje, :integer, default: 1
  end
end
