class ProductMailer < ApplicationMailer
  def product_mail(product)
    @product = product
    admin_user = User.select { |u| u.admin? }
    mail bcc: admin_user.pluck(:email), subject: t("mailer.products.messages.create")
  end

  def product_send_back_mail(product)
    @product = product

    mail to: product.user.email, subject: t("mailer.products.messages.send_back")
  end
end
