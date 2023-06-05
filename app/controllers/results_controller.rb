class ResultsController < ApplicationController
before_action :set_negotiation, only: %i[create edit update]

  def edit
    @result = @negotiation.results.find(params[:id])

    respond_to do |format|
      flash.now[:notice] = t("views.results.messages.edit")
      format.js { render :edit }
    end
  end

  def create
    @result = @negotiation.results.build(result_params)
    @result.user_id = current_user.id

    respond_to do |format|
      if @result.save
        format.js { render :index }
      else
        format.html { redirect_to negotiation_path(@negotiation), notice: t("errors.messages.can_not_register") }
      end
    end
  end

  def update
    @result = @negotiation.results.find(params[:id])

    respond_to do |format|
      if @result.update(result_params)
        flash.now[:notice] = t("views.results.messages.update")
        format.js { render :index }
      else
        flash.now[:notice] = t("errors.messages.can_not_update")
        format.js { render :edit }
      end
    end
  end

  def destroy
    @result = Result.find(params[:id])
    @result.destroy
    
    respond_to do |format|
      flash.now[:notice] = t("views.results.messages.destroy")
      format.js { render :index }
    end
  end

  private

  def set_negotiation
    @negotiation = Negotiation.find(params[:negotiation_id])
  end

  def result_params
    params.require(:result).permit(:content, :reference_image, :user_id, :result_id)
  end
end
