namespace :batch do
  desc "Send email to users"
  task send_emails: :environment do
    User.all.each do |user|
      other_users = User.where.not(id: user.id)
      received_messages_count = 0
      other_users.each do |other_user|
        received_messages_count += other_user.messages.count
      end
      UserMailer.sent_messages_email(user, received_messages_count, user.email).deliver_now
    end
  end
end
