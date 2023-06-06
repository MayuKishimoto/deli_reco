class NegotiationMailer < ApplicationMailer
  def negotiation_mail(negotiation)
    @negotiation = negotiation

    mail to: @negotiation.email, subject: "お問い合わせの確認メール"
  end
end
