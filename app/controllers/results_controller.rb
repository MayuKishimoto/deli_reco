class ResultsController < ApplicationController
before_action :set_negotiation, only: %i[ create edit update ]
before_action :require_admin_or_sales

  def edit
    @result = @negotiation.result

    respond_to do |format|
      flash.now[:notice] = t("views.results.messages.edit")
      format.js { render :edit }
    end
  end

  def create
    @result = @negotiation.build_result(result_params)
    @result.user_id = current_user.id

    respond_to do |format|
      if @result.save
        format.js { render :show }
        ResultMailer.result_mail(@result).deliver
      else
        format.html { redirect_to product_path(@negotiation.product), notice: t("errors.messages.can_not_register") }
      end
    end
  end

  def update
    @result = @negotiation.result

    respond_to do |format|
      if @result.update(result_params)
        flash.now[:notice] = t("views.results.messages.update")
        format.js { render :show }
      else
        flash.now[:notice] = t("errors.messages.can_not_update")
        format.js { render :edit }
      end
    end
  end

  private

  def set_negotiation
    @negotiation = Negotiation.find(params[:negotiation_id])
  end

  def require_admin_or_sales
    redirect_to products_path, notice: t("errors.messages.can_not_access") unless current_user.admin? || current_user.sales?
  end

  def result_params
    params.require(:result).permit(:content, :reference_image, :reference_image_cache)
  end
end
