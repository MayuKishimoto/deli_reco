class NegotiationMailer < ApplicationMailer
  def negotiation_mail(negotiation)
    @negotiation = negotiation

    mail to: "nhpw@hotmail.co.jp", subject: "お問い合わせの確認メール"
  end
end
