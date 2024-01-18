class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.success.subject
  #
  def success
    @page = params[:result].page
    mail to: ENV.fetch("TO_EMAIL", "to@example.org")
  end
end
