require 'rails_helper'

RSpec.describe "line_items/index", :type => :view do
  before(:each) do
    assign(:line_items, [
      LineItem.create!(
        :qty => "9.99",
        :product => nil
      ),
      LineItem.create!(
        :qty => "9.99",
        :product => nil
      )
    ])
  end

  it "renders a list of line_items" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
