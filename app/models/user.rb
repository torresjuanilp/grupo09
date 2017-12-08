class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable_user!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :questions
	has_many :answers
	accepts_nested_attributes_for :questions
	has_many :permits
	belongs_to :faculty
end
