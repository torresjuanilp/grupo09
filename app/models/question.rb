class Question < ActiveRecord::Base
	#has_many : answers 
	has_many :comments
	has_and_belongs_to_many :categories, :join_table => 'categories_questions'
	belongs_to :user
	belongs_to :faculty
	has_many :answers
	accepts_nested_attributes_for :categories
	validates_uniqueness_of :titulo
	
	
	validates :titulo, :presence => true,
                    :length => { :minimum => 5 }
	validates :descripcion, :presence => true,
                    :length => { :minimum => 1 }  
	validates :categories, :length => { :maximum => 5}
					
	
	default_scope -> { order("created_at desc") }
scope :recent, -> { Question.unscope(:order).order("visits_count desc, created_at DESC").where("created_at >= ?", 1.month.ago) }

def self.search(search)
  #where("titulo LIKE ?", "%#{search}%")
  where("titulo LIKE ? OR descripcion LIKE ?", "%#{search}%","%#{search}%")
end

def self.recent_visit_questions
	Question.where("created_at >= ?", 1.month.ago.utc).order("visits_count DESC, created_at DESC")
end

	
end
