require 'rails_helper'

RSpec.describe "stocks/new", type: :view do
  before(:each) do
    assign(:stock, Stock.new(
      :item => nil,
      :warehouse => nil
    ))
  end

  it "renders new stock form" do
    render

    assert_select "form[action=?][method=?]", stocks_path, "post" do

      assert_select "input#stock_item_id[name=?]", "stock[item_id]"

      assert_select "input#stock_warehouse_id[name=?]", "stock[warehouse_id]"
    end
  end
end
