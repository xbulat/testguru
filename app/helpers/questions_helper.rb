module QuestionsHelper
  def question_header(question)
    template = question.persisted? ? 'Edit %s question' : 'Create new %s question'
    template % question.test.title
  end
end
