class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true )}
  validates :body, presence: true
  validate :answer_limit, on: :create

  private
  def answer_limit
    errors.add(:answer_limit, "Max. allow 4 answers") if question.answer.size > 4
  end
end
