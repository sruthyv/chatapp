class UserMailer < ApplicationMailer
  def sent_messages_email(user, received_messages, to_email)
    @user = user
    @sent_messages = user.messages.count
    @received_messages = received_messages

    mail(to: to_email, subject: "Sent Messages")
  end
end
