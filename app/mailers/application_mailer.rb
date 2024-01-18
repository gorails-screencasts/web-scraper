class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("FROM_EMAIL", "from@example.org")
  layout "mailer"
end
