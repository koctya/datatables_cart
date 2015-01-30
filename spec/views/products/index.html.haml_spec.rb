require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :desc => "MyText",
        :img_url => "Img Url",
        :price => "19.99"
      ),
      Product.create!(
        :name => "Name2",
        :desc => "MyText 2",
        :img_url => "Img Url",
        :price => "29.99"
      )
    ])
  end

  xit "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Img Url".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
