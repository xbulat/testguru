class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :check_answer_limit, on: :create

  private

  def check_answer_limit
    errors.add(:answer_limit, 'Max. allow 4 answers') if question.answer.count >= 4
  end
end
