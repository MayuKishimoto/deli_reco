class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[ show edit update destroy ]
  
  def index
    @products = Product.where(application_status: 2)
  end

  # def request_index
  #   @products = Product.where(application_status: 1).or(Product.where(application_status: 3))
  # end

  # /products/approved_index
  # products/approved_index.html.erb
  # def approved_index
  #   @products = Product.where~
  # end
  
  # def unapproved_index
  #   @products = Product.where~
  # end

  def show
    @negotiations = @product.negotiations
    @negotiation = @product.negotiations.build
  end

  # def request_show
  # end
    
  # def new
  #   # 営業以外は404にする unless current.user.department.name == "営業" 
  #   @product = Product.new
  # end

  def edit
  end
  
  # def create
  #   # 営業以外は404にする unless current.user.department.name == "営業" 
  #   @product = current_user.products.build(product_params)

  #   if @product.save
  #     redirect_to product_url(@product), notice: t("views.products.messages.create")
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def update
    if @product.update(product_params)
      redirect_to product_url(@product), notice: t("views.products.messages.update")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def request_update
  #   if @product.update(product_params)
  #     redirect_to request_product_url(@product), notice: t("views.products.messages.request_update")
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @product.destroy!

    redirect_to products_url, notice: t("views.products.messages.destroy")
  end

  # def request_destroy
  #   @product.destroy!

  #   redirect_to products_url, notice: t("views.products.messages.destroy")
  # end

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
