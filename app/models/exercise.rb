class Exercise < ApplicationRecord
  belongs_to :user
  has_many :mcqs
  has_many :feedbacks
end
