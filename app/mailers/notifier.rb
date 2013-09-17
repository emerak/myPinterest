class Notifier < ActionMailer::Base
  default from: "alejandra.cernas@tangosource.com"
  def welcome_email(user)
    @user   = user
    subject = "Welcome #{user.email}"
    attachments["tango_source.jpg"] = File.read(Rails.root.join('app','assets','images','tango_source.jpg'))
    mail( to: user.email, subject: subject)
  end
end
