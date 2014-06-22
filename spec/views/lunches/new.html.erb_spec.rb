require 'rails_helper'

RSpec.describe "lunches/new", :type => :view do
  before(:each) do
    assign(:lunch, Lunch.new(
      :name => "MyString",
      :description => "MyText",
      :state => "MyString"
    ))
  end

  it "renders new lunch form" do
    render

    assert_select "form[action=?][method=?]", lunches_path, "post" do

      assert_select "input#lunch_name[name=?]", "lunch[name]"

      assert_select "textarea#lunch_description[name=?]", "lunch[description]"

      assert_select "input#lunch_state[name=?]", "lunch[state]"
    end
  end
end
