require 'rails_helper'

RSpec.describe "lunches/edit", :type => :view do
  before(:each) do
    @lunch = assign(:lunch, Lunch.create!(
      :name => "MyString",
      :description => "MyText",
      :state => "MyString"
    ))
  end

  it "renders the edit lunch form" do
    render

    assert_select "form[action=?][method=?]", lunch_path(@lunch), "post" do

      assert_select "input#lunch_name[name=?]", "lunch[name]"

      assert_select "textarea#lunch_description[name=?]", "lunch[description]"

      assert_select "input#lunch_state[name=?]", "lunch[state]"
    end
  end
end
