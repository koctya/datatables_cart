require 'rails_helper'

RSpec.describe "line_items/show", :type => :view do
  before(:each) do
    @line_item = assign(:line_item, LineItem.create!(
      :qty => "9.99",
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
