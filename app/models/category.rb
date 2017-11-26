class Category < ApplicationRecord
	has_and_belongs_to_many :questions, :join_table => 'categories_questions'
	
	validates_uniqueness_of :name
	validates :name, :presence => true,
                     :length => { :minimum => 1 } 
	
	
	scope :permitted, -> { Category.where.not(name: 'General') }
end
