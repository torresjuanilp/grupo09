class Comment < ApplicationRecord
	
	
belongs_to :question
belongs_to :user
belongs_to :answer

validates :texto, :presence => true
end
