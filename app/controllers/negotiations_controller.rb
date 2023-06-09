class NegotiationsController < ApplicationController
  before_action :set_product, only: %i[ create edit update destroy ]
  before_action :require_admin_or_developer

  def edit
    @negotiation = @product.negotiations.find(params[:id])

    respond_to do |format|
      flash.now[:notice] = t("views.negotiations.messages.edit")
      format.js { render :edit }
    end
  end

  def create
    @negotiation = @product.negotiations.build(negotiation_params)
    @negotiation.user_id = current_user.id
    
    respond_to do |format|
      if @negotiation.save
        format.js { render :index }
        NegotiationMailer.negotiation_mail(@negotiation).deliver
      else
        format.html { redirect_to product_path(@product), notice: t("errors.messages.can_not_register") }
      end
    end
  end

  def update
    @negotiation = @product.negotiations.find(params[:id])

    respond_to do |format|
      if @negotiation.update(negotiation_params)
        flash.now[:notice] = t("views.negotiations.messages.update")
        format.js { render :index }
      else
        flash.now[:notice] = t("errors.messages.can_not_update")
        format.js { render :edit }
      end
    end
  end

  def destroy
    @negotiation = Negotiation.find(params[:id])
    @negotiation.destroy
    
    respond_to do |format|
      flash.now[:notice] = t("views.negotiations.messages.destroy")
      format.js { render :index }
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def require_admin_or_developer
    redirect_to products_path, notice: t("errors.messages.can_not_access") unless current_user.admin? || current_user.developer?
  end

  def negotiation_params
    params.require(:negotiation).permit(
      :negotiate_at, :name, :selling_price, :wholesale_price,
      :product_image, :product_image_cache, :explanation
    )
  end
end
