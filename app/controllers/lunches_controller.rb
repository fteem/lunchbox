class LunchesController < ApplicationController
  respond_to :json

  def index
    @lunches = Lunch.pending
    renspond_with @lunches
  end
  

  private
  def lunch_params

  end
end
