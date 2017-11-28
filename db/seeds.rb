# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	Category.destroy_all
	Question.destroy_all
	Permit.destroy_all
	gen=Category.find_or_create_by(name: "General")
	rails=Category.find_or_create_by(name: "Rails")
	ruby=Category.find_or_create_by(name: "Ruby")
	info=Category.find_or_create_by(name: "Informática")
	Permit.find_or_create_by(name: "Crear pregunta", score: 1, descripcion: "Crear una pregunta o una respuesta", user_id: 1)
	Permit.find_or_create_by(name: "Votar positivo", score: 15, descripcion: "Votar de forma positiva en una pregunta, respuesta o comentario", user_id: 1)
	Permit.find_or_create_by(name: "Comentar", score: 20, descripcion: "Comentar en preguntas y respuestas", user_id: 1)
	Permit.find_or_create_by(name: "Votar negativo", score: 100, descripcion: "Votar de forma negativa en preguntas y respuestas", user_id: 1)
	Permit.find_or_create_by(name: "Administrar categorias", score: 300, descripcion: "Crear y eliminar categoías", user_id: 1)
	Permit.find_or_create_by(name: "Administrar facultades", score: 500, descripcion: "Crear y eliminar facultades", user_id: 1)
	Permit.find_or_create_by(name: "Modificar contenidos", score: 1000, descripcion: "Modificar contenido creado por otros usuarios", user_id: 1)	
