class Request::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[ show edit update destroy ]

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
      redirect_to request_product_url(@product), notice: t("views.request_products.messages.create")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to request_products_url, notice: t("views.request_products.messages.update")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy!

    redirect_to  request_products_url, notice: t("views.request_products.messages.destroy")
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :assumed_name, :assumed_selling_price, :assumed_wholesale_price,
      :start_on, :period,	:volume, :purpose, :concept,
      :reference_image, :reference_image_cache, :status,
      :client_id,	:category_id,	:application_status, :remand_reason
    )
  end
end
