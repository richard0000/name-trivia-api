class NameInfoMailer < ApplicationMailer
  def send_info_email(recipient_email, email_body)
    mail(to: recipient_email, subject: 'Information about famous people with your name', body: email_body)
  end
end
