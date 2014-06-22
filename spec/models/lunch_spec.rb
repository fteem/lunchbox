require 'rails_helper'

RSpec.describe Lunch, :type => :model do
  subject do 
    Lunch.new(:name => "Let's have some lunch", 
    description: "Lorem ipsum",
    state: "pending",
    starts_on: Date.today + 1.day,
    ends_on: Date.today + 2.days)
   end

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:state) }
  it { should respond_to(:starts_on) }
  it { should respond_to(:ends_on) }
  it { should be_valid }

  describe "Validations" do
    it "without a name - should be invalid" do
      subject.name = ""
      expect(subject).to be_invalid
    end

    it 'without a description - should be invalid' do
      subject.description = ""
      expect(subject).to be_invalid
    end

    it 'without a start date - should be invalid' do
      subject.starts_on = ""
      expect(subject).to be_invalid
    end

    it 'without an end date - should be invalid' do
      subject.ends_on = ""
      expect(subject).to be_invalid
    end

    it 'should be invalid if starts_on is not a date' do
      subject.starts_on = "a string"
      expect(subject).to be_invalid
    end

    it 'should be invalid if ends_on is not a date' do
      subject.ends_on = "a string"
      expect(subject).to be_invalid
    end
  end

  describe "States" do
    it "should be pending when created" do
      lunch = FactoryGirl.create :lunch
      expect(lunch.state).to eq "pending"
    end 

    it "should be started if starts_on is in the past and ends_on is in the future" do
      lunch = FactoryGirl.create :lunch, starts_on: Date.today - 1.day, ends_on: Date.today + 1.day
      expect(lunch.state).to eq "started"
    end

    it "should be ended if ends_on is in the past" do
      lunch = FactoryGirl.create :lunch, starts_on: Date.today - 2.days, ends_on: Date.today - 1.day
      expect(lunch.state).to eq "ended"
    end

    it "should raise an error if the dates are invalid" do
      lunch = 
      expect{
        FactoryGirl.create :lunch, starts_on: Date.today + 2.days, ends_on: Date.today - 1.day
       }.to raise_error
    end 
  end 

end