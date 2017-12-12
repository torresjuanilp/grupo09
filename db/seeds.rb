# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	
	
	Permit.destroy_all
	Faculty.destroy_all
	Question.destroy_all
	
	Category.find_or_create_by(name: "General")
	Category.find_or_create_by(name: "Rails")
	Category.find_or_create_by(name: "Ruby")
	Category.find_or_create_by(name: "Informática")

	Permit.find_or_create_by(name: "Crear pregunta", score: 1, descripcion: "Crear una pregunta o una respuesta", user_id: 1, enabled: true)
	Permit.find_or_create_by(name: "Votar positivo", score: 15, descripcion: "Votar de forma positiva en preguntas, respuests y comentarios", user_id: 1, enabled: true)
	Permit.find_or_create_by(name: "Comentar", score: 20, descripcion: "Comentar en preguntas y respuestas", user_id: 1, enabled: true)
	Permit.find_or_create_by(name: "Votar negativo", score: 100, descripcion: "Votar de forma negativa en preguntas, respuestas y comentarios", user_id: 1, enabled: true)
	Permit.find_or_create_by(name: "Administrar categorias", score: 300, descripcion: "Crear, editar y eliminar categoías", user_id: 1, enabled: true)
	Permit.find_or_create_by(name: "Administrar facultades", score: 500, descripcion: "Crear, editar y eliminar facultades", user_id: 1, enabled: true)
	Permit.find_or_create_by(name: "Modificar contenidos", score: 1000, descripcion: "Modificar contenido creado por otros usuarios", user_id: 1, enabled: true)	

	Faculty.find_or_create_by(name: "Otra")
	Faculty.find_or_create_by(name: "Ingeniería")
	Faculty.find_or_create_by(name: "Informática")
	Faculty.find_or_create_by(name: "Ciencias Médicas")
	Faculty.find_or_create_by(name: "Periodismo y Comunicación Social")
	Faculty.find_or_create_by(name: "Ciencias Naturales y Museo")
	Faculty.find_or_create_by(name: "Humanidades y Ciencias de la Educación")
	Faculty.find_or_create_by(name: "Arquitectura y Urbanismo")
	Faculty.find_or_create_by(name: "Ciencias Exactas")
