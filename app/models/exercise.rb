class Exercise < ApplicationRecord
  belongs_to :user
  has_many :mcqs
end
