class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @user = feedback.user
    @feedback = feedback

    mail to: Rails.application.credentials.mail_to_user || 'root'
   end
end
