require 'rails_helper'

RSpec.describe "stocks/edit", type: :view do
  before(:each) do
    @stock = assign(:stock, Stock.create!(
      :item => nil,
      :warehouse => nil
    ))
  end

  it "renders the edit stock form" do
    render

    assert_select "form[action=?][method=?]", stock_path(@stock), "post" do

      assert_select "input#stock_item_id[name=?]", "stock[item_id]"

      assert_select "input#stock_warehouse_id[name=?]", "stock[warehouse_id]"
    end
  end
end
