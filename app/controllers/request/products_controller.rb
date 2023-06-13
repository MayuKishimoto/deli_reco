class Request::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :require_admin_or_sales

  def index
    @q = Product.where(application_status: 1).or(Product.where(application_status: 3)).ransack(params[:q])
    @products = @q.result.order(updated_at: "DESC")
  end

  def show
  end
    
  def new
    @product = Product.new
  end

  def edit
  end
  
  def create
    @product = current_user.products.build(product_params)

    if @product.save
      ProductMailer.new_product_mail(@product).deliver
      redirect_to request_products_url, notice: t("views.request_products.messages.create")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      if @product.application_status == "差戻"
        ProductMailer.product_send_back_mail(@product).deliver
      end
      if @product.application_status == "承認" && @product.users.present?
        ProductMailer.assigned_product_mail(@product).deliver
      end
      redirect_to request_products_url, notice: t("views.request_products.messages.update")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to request_products_url, notice: t("views.request_products.messages.destroy")
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def require_admin_or_sales
    redirect_to products_path, notice: t("errors.messages.can_not_access") unless current_user.admin? || current_user.sales?
  end

  def product_params
    params.require(:product).permit(
      :assumed_name, :assumed_selling_price, :assumed_wholesale_price,
      :start_on, :period,	:volume, :purpose, :concept,
      :reference_image, :reference_image_cache, :status,
      :client_id,	:category_id,	:application_status, :remand_reason, user_ids: []
    )
  end
end
