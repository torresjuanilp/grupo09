class CantCategoriasEnPregunta < ActiveRecord::Migration[5.1.4]
  def change
	add_column :questions, :categorias, :integer
  end
end
