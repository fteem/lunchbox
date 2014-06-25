require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "Associations" do
    it { should have_many(:organized_lunches) }
    it { should have_and_belong_to_many(:attended_lunches) }
  end
end
