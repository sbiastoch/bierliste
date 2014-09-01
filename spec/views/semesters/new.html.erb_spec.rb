require 'spec_helper'

describe "semesters/new" do
  before(:each) do
    assign(:semester, stub_model(Semester,
      :cash => 1.5,
      :bank => 1.5,
      :active => false
    ).as_new_record)
  end

  it "renders new semester form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", semesters_path, "post" do
      assert_select "input#semester_cash[name=?]", "semester[cash]"
      assert_select "input#semester_bank[name=?]", "semester[bank]"
      assert_select "input#semester_active[name=?]", "semester[active]"
    end
  end
end
