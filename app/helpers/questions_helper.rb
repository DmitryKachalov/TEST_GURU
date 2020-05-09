module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "#{I18n.t('helpers.question_header.new_question')}
      '#{question.test.title}'"
    else
      "#{I18n.t('helpers.question_header.edit_question')}
      '#{question.test.title}'"
    end
  end
end
