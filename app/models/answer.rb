class Answer < ApplicationRecord

belongs_to :question, counter_cache: true
belongs_to :user
has_many :comments
has_many :answer_votes, dependent: :destroy
end
