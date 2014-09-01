require 'spec_helper'

describe "entries/edit" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :receipt => "MyString",
      :description => "MyString",
      :amount => 1.5
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do
      assert_select "input#entry_receipt[name=?]", "entry[receipt]"
      assert_select "input#entry_description[name=?]", "entry[description]"
      assert_select "input#entry_amount[name=?]", "entry[amount]"
    end
  end
end
