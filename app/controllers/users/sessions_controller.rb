# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def sales_guest_sign_in
    user = User.sales_guest
    sign_in(user)
    unless user.sales?
      user.departments << Department.find_by(name: "営業")
    end
    redirect_to request_products_path, notice: t('views.homes.messages.sales_guest_sign_in')
  end

  def developer_guest_sign_in
    user = User.developer_guest
    sign_in(user)
    unless user.developer?
      user.departments << Department.find_by(name: "開発")
    end
    redirect_to products_path, notice: t('views.homes.messages.developer_guest_sign_in')
  end

  def admin_guest_sign_in
    user = User.admin_guest
    sign_in user
    redirect_to request_products_path, notice: t('views.homes.messages.admin_guest_sign_in')
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
