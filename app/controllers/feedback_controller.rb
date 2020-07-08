class FeedbackController < ApplicationController

  def new; end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer
          .feedback_email(@feedback)
          .deliver
      redirect_to new_feedback_url, notice: t('.message_sent')
    end
  end

  private

  def feedback_params
    params.permit([:email, :message])
  end
end
