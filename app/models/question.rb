class Question < ApplicationRecord
  has_one :test
  has_many :answer, dependent: :destroy
end
