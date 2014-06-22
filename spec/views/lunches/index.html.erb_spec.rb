require 'rails_helper'

RSpec.describe "lunches/index", :type => :view do
  before(:each) do
    assign(:lunches, [
      Lunch.create!(
        :name => "Name",
        :description => "MyText",
        :state => "State"
      ),
      Lunch.create!(
        :name => "Name",
        :description => "MyText",
        :state => "State"
      )
    ])
  end

  it "renders a list of lunches" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
