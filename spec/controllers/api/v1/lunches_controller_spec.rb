require 'rails_helper'

RSpec.describe Api::V1::LunchesController, :type => :controller do

  describe '#index' do
    it 'returns pending lunches' do
      expect(Lunch).to receive(:pending)

      get :index, format: :json
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    it 'creates a new lunch entry if lunch is valid' do
      expect { 
        post :create, lunch: { name: "Some lunch", description: "Lorem ipsum", 
          starts_on: Date.today + 1.day, ends_on: Date.today + 2.days }, format: :json
      }.to change(Lunch, :count).by(1)
      expect(response).to be_success
    end

    it 'returns error if lunch is invalid' do
      post :create, lunch: { name: 'Some lunch' } #missing other params
      json = JSON.parse(response.body)
      expect(json["errors"]).to have_key("description") 
      expect(json["errors"]).to have_key("starts_on") 
      expect(json["errors"]).to have_key("ends_on") 
      expect(response).to_not be_success
    end
  end

  describe 'PATCH #update' do
    it 'updates a lunch entry' do
      lunch = FactoryGirl.create :pending_lunch
      # sanity check
      expect(lunch.name).to eq "Some lunch in a restaurant"
      patch :update, id: lunch.id, lunch: { name: "Ile's lunch" }
      json = JSON.parse(response.body) 
      expect(json["name"]).to eq "Ile's lunch"
      expect(response).to be_success
    end
  end

  describe "DELETE destroy" do
    it 'deletes a lunch entry' do
      lunch = FactoryGirl.create :pending_lunch
      expect { 
        delete :destroy, id: lunch.id
      }.to change(Lunch, :count).by(-1)
    end
  end
end