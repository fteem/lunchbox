require 'rails_helper'

RSpec.describe Api::V1::LunchesController, :type => :controller do

  describe '#index' do
    it 'returns pending lunches' do
      expect(Lunch).to receive(:pending)

      get :index, format: :json
      expect(response).to be_success
    end
  end
end