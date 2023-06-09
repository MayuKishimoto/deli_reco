class NegotiationMailer < ApplicationMailer
  def negotiation_mail(negotiation)
    @negotiation = negotiation

    mail to: @negotiation.product.user.email, subject: t("mailer.negotiations.messages.create")
  end
end
