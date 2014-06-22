require 'rails_helper'

RSpec.describe "Lunches", :type => :request do
  describe "GET /lunches" do
    it "works! (now write some real specs)" do
      get lunches_path
      expect(response.status).to be(200)
    end
  end
end
