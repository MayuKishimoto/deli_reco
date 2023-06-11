class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[ show edit update destroy ]
  
  def index
    @q = Product.where(application_status: 2).ransack(params[:q])
    @products = @q.result.order(updated_at: "DESC")
  end

  def show
    @negotiations = @product.negotiations.order(negotiate_at: "DESC",name: "ASC")
    @negotiation = @product.negotiations.build
    @result = Result.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_url(@product), notice: t("views.products.messages.update")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy!

    redirect_to products_url, notice: t("views.products.messages.destroy")
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
