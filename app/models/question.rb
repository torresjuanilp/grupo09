class Question < ActiveRecord::Base
	#has_many : answers 
	#has_many :comments
	belongs_to :user
	has_many :answers
	validates_uniqueness_of :titulo



  validates :titulo, :presence => true,
                    :length => { :minimum => 5 }
 validates :descripcion, :presence => true,
                    :length => { :minimum => 1 }                   
end
