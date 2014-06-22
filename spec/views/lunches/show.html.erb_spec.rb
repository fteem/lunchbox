require 'rails_helper'

RSpec.describe "lunches/show", :type => :view do
  before(:each) do
    @lunch = assign(:lunch, Lunch.create!(
      :name => "Name",
      :description => "MyText",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/State/)
  end
end
