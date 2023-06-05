class NegotiationsController < ApplicationController
  before_action :set_product, only: [:create, :edit, :update]

  def create
    @negotiation = @product.negotiations.build(negotiation_params)
    @negotiation.user_id = current_user.id
    respond_to do |format|
      if @negotiation.save
        format.js { render :index }
      else
        format.html { redirect_to product_path(@product), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @negotiation = @product.negotiations.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @negotiation = @product.negotiations.find(params[:id])
      respond_to do |format|
        if @negotiation.update(negotiation_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit }
        end
      end
  end

  def destroy
    @negotiation = Negotiation.find(params[:id])
    @negotiation.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def negotiation_params
    params.require(:negotiation).permit(
      :negotiate_at, :name, :selling_price, :wholesale_price,
      :product_image, :product_image_cache, :explanation, :user_id, :product_id
    )
  end
end
