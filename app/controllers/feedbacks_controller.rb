class FeedbacksController < ApplicationController
  def new
    @feedback = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(resource_params)

    if @feedback.valid?
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      redirect_to tests_path, notice: t('.feedback_notice')
    else
      render :new
    end
  end

  private

  def resource_params
    params.require(:feedback).permit(:title, :body)
  end
end
