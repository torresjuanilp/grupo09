class Question < ActiveRecord::Base
	#has_many : answers 
	has_many :comments
	has_and_belongs_to_many :categories, :join_table => 'categories_questions'
	belongs_to :user
	has_many :answers
	validates_uniqueness_of :titulo
	
	validate :categories_count_within_bounds
	
	validates :titulo, :presence => true,
                    :length => { :minimum => 5 }
	validates :descripcion, :presence => true,
                    :length => { :minimum => 1 }  

	private
	def categories_count_within_bounds
		return if categories.size <= 1
		errors.add('¡Demasiadas categorías!') if categories.size > 5
	end
end
