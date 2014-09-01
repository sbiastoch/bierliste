require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :receipt => "MyString",
      :description => "MyString",
      :amount => 1.5
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entries_path, "post" do
      assert_select "input#entry_receipt[name=?]", "entry[receipt]"
      assert_select "input#entry_description[name=?]", "entry[description]"
      assert_select "input#entry_amount[name=?]", "entry[amount]"
    end
  end
end
