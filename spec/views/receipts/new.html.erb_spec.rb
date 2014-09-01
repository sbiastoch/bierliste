require 'spec_helper'

describe "receipts/new" do
  before(:each) do
    assign(:receipt, stub_model(Receipt,
      :category_id => 1,
      :description => "MyString",
      :type => "",
      :amount => 1.5
    ).as_new_record)
  end

  it "renders new receipt form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", receipts_path, "post" do
      assert_select "input#receipt_category_id[name=?]", "receipt[category_id]"
      assert_select "input#receipt_description[name=?]", "receipt[description]"
      assert_select "input#receipt_type[name=?]", "receipt[type]"
      assert_select "input#receipt_amount[name=?]", "receipt[amount]"
    end
  end
end
