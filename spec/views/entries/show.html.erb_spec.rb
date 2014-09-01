require 'spec_helper'

describe "entries/show" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :receipt => "Receipt",
      :description => "Description",
      :amount => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Receipt/)
    rendered.should match(/Description/)
    rendered.should match(/1.5/)
  end
end
