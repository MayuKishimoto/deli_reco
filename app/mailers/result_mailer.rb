class ResultMailer < ApplicationMailer
  def result_mail(result)
    @result = result

    mail to: @result.negotiation.user.email, subject: t("mailer.results.messages.create")
  end
end
