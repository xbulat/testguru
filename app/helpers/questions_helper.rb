module QuestionsHelper
  def question_header(obj)
    template = obj.persisted? ? 'Edit %s question' : 'Create new %s question'
    template % obj.test.title
  end
end
