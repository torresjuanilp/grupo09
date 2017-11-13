class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable_user!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
