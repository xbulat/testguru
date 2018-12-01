class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback, email)
    @feedback = feedback
    @email = email

    mail(to: Rails.application.credentials.mail_to_user || 'root', subject: 'Feedback from TestGuru')
   end
end
