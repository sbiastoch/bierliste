require 'spec_helper'

describe "receipts/show" do
  before(:each) do
    @receipt = assign(:receipt, stub_model(Receipt,
      :category_id => 1,
      :description => "Description",
      :type => "Type",
      :amount => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Description/)
    rendered.should match(/Type/)
    rendered.should match(/1.5/)
  end
end
