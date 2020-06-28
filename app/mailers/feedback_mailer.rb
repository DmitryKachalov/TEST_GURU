class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.first.email }

  def feedback_email(feedback)
    @feedback_author_email = feedback.email
    @feedback_message = feedback.message
    mail(subject: 'Test guru feedback')
  end
end
