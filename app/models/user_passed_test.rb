class UserPassedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_validation_set_next_question

  SUCCESS_RATE = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if (correct_answer?(answer_ids) && answer_ids.present?)
    save!
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def total_questions
    @total_questions ||= test.questions.count
  end

  def results
    (correct_questions.to_f / total_questions) * 100
  end

  def success?
    results >= SUCCESS_RATE
  end

  def timeout?
    return false unless timer?

    Time.current > limit_time
  end

  def ontime?
    !timeout?
  end

  def timer?
    test.timer.nonzero?
  end

  def time_left
    (limit_time - Time.current).to_i
  end

  private
  def limit_time
    created_at + test.timer.seconds
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil? && test.present?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
