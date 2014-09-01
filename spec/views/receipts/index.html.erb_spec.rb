require 'spec_helper'

describe "receipts/index" do
  before(:each) do
    assign(:receipts, [
      stub_model(Receipt,
        :category_id => 1,
        :description => "Description",
        :type => "Type",
        :amount => 1.5
      ),
      stub_model(Receipt,
        :category_id => 1,
        :description => "Description",
        :type => "Type",
        :amount => 1.5
      )
    ])
  end

  it "renders a list of receipts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
