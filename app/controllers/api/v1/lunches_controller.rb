class Api::V1::LunchesController < ApplicationController
  respond_to :json

  def index
    @lunches = Lunch.pending
    respond_with @lunches
  end
  

  private
  def lunch_params

  end
end
