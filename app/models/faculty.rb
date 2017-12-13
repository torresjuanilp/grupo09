class Faculty < ApplicationRecord
	has_many :users
	has_many :questions
	scope :preguntas, -> { order("questions_count desc") }
end
