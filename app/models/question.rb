class Question < ApplicationRecord
  belongs_to :test

  has_many :answer, dependent: :destroy

  validates :body, presence: true
end
