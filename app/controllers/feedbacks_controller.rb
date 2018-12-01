class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(resource_params)

    if @feedback.valid?
      FeedbacksMailer.send_feedback(@feedback, current_user.email).deliver_now
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
