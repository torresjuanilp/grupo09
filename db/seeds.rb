# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	Category.destroy_all
	Question.destroy_all
	gen=Category.find_or_create_by(name: "General")
	rails=Category.find_or_create_by(name: "Rails")
	ruby=Category.find_or_create_by(name: "Ruby")
	Question.find_or_create_by(titulo: "¿Cómo funciona Rails?", descripcion: "¡Ayuda!", user_id: 2, categories:  [ruby, rails])
	Question.find_or_create_by(titulo: "Ruby es un dolor de cabeza", descripcion: "D:", user_id: 2, categories:  [ruby, rails])
	Question.find_or_create_by(titulo: "Test!", descripcion: "Test?", user_id: 2, categories:  [rails])
	Question.find_or_create_by(titulo: "Eliminame!", descripcion: ":D", user_id: 2, categories: [rails, ruby])