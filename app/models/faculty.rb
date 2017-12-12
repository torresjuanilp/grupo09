class Faculty < ApplicationRecord
	has_many :users
	has_many :questions

end
