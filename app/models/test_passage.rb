class TestPassage < ApplicationRecord

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true



  before_validation :before_validation_set_current_question, on: %i[create update]
  before_update :before_update_test_passed

  def before_update_test_passed
    self.passed = successfully_completed? if completed?
  end


  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    return unless test.time_limited?

    self.current_question = nil if time_left <= 0
    save!
  end

  def test_questions_count
    test.questions.count
  end

  def test_success
    (correct_questions * 100 / test_questions_count).to_i
  end

  def successfully_completed?
    test_success >= 85
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def time_left
    (created_at.to_i + test.time_limit) - Time.current.to_i
  end

  private
  
  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = if new_record?
                              test.questions.first
                            else
                              questions_collection.first
                            end
  end

  def questions_collection
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
