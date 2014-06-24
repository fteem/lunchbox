class Api::V1::LunchesController < ApplicationController
  respond_to :json

  def index
    @lunches = Lunch.pending
    render json: @lunches
  end

  def create
    @lunch = Lunch.new(lunch_params)
    if @lunch.save
      render json: @lunch
    else
      render json: { "errors" => @lunch.errors }, status: 400
    end
  end

  def update
    @lunch = Lunch.find(params[:id])
    if @lunch.update_attributes(lunch_params)
      render json: @lunch
    else
      render json: { "errors" => @lunch.errors }, status: 400
    end
  end

  def destroy
    @lunch = Lunch.find(params[:id])
    if @lunch.destroy
      render json: { "success" => "Lunch has been deleted." }
    else
      render json: { "errors" => @lunch.errors }, status: 400
    end
  end

  private
  def lunch_params
    params.require(:lunch).permit(:name, :description, :starts_on, :ends_on)
  end
end
