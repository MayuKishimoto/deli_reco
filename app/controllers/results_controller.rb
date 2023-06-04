class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[ show edit update destroy ]
  
  def index
    @results = Result.all
  end

  def show
  end
    
  def new
    @result = Result.new
  end

  def edit
  end
  
  def create
    @result = Result.new(result_params)

    if @result.save
      redirect_to result_url(@result), notice: t("views.results.messages.create")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @result.update(result_params)
      redirect_to result_url(@result), notice: t("views.results.messages.update")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @result.destroy!

    redirect_to results_url, notice: t("views.results.messages.destroy")
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit(:content, :reference_image, :user_id, :negotiation_id)
  end
end
