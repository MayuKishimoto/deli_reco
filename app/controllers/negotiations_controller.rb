class NegotiationsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_negotiation, only: %i[ show edit update destroy ]
  
  # def index
  #   @negotiations = Negotiation.all
  # end

  # def show
  # end
    
  # def new
  #   @negotiation = Negotiation.new
  # end

  # def edit
  # end
  
  def create
    @product = Product.find(params[:product_id])
    @negotiation = @product.negotiations.build(negotiation_params)
    @negotiation.user_id = current_user.id

    respond_to do |format|
      if @negotiation.save
        format.html { redirect_to product_path(@product) }
      else
        format.html { redirect_to product_path(@product), notice: '投稿できませんでした...' }
      end
    end


    # @negotiation = Negotiation.new(negotiation_params)

    # if @negotiation.save
    #   redirect_to negotiation_url(@negotiation), notice: t("views.negotiations.messages.create")
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  # def update
  #   if @negotiation.update(negotiation_params)
  #     redirect_to negotiation_url(@negotiation), notice: t("views.negotiations.messages.update")
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @negotiation.destroy!

  #   redirect_to negotiations_url, notice: t("views.negotiations.messages.destroy")
  # end

  # private

  # def set_negotiation
  #   @negotiation = Negotiation.find(params[:id])
  # end

  def negotiation_params
    params.require(:negotiation).permit(
      :negotiate_at, :name, :selling_price, :wholesale_price,
      :product_image, :product_image_cache, :explanation, :user_id, :product_id
    )
  end
end
