module QuestionsHelper
  def question_header(obj, action)
    template = { new: 'Create New %s Question',
                 edit: 'Edit %s Question' }

    template.fetch(action.to_sym) % obj.title if obj.respond_to?(:title)
  end
end
