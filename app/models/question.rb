class Question < ApplicationRecord
  belongs_to :discipline
  has_many :question_accesses
end
