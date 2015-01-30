require 'rails_helper'

RSpec.describe "line_items/edit", :type => :view do
  before(:each) do
    @line_item = assign(:line_item, LineItem.create!(
      :qty => "9.99",
      :product => nil
    ))
  end

  xit "renders the edit line_item form" do
    render

    assert_select "form[action=?][method=?]", line_item_path(@line_item), "post" do

      assert_select "input#line_item_qty[name=?]", "line_item[qty]"

      assert_select "input#line_item_product_id[name=?]", "line_item[product_id]"
    end
  end
end
