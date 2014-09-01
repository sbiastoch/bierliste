require 'spec_helper'

describe "semesters/edit" do
  before(:each) do
    @semester = assign(:semester, stub_model(Semester,
      :cash => 1.5,
      :bank => 1.5,
      :active => false
    ))
  end

  it "renders the edit semester form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", semester_path(@semester), "post" do
      assert_select "input#semester_cash[name=?]", "semester[cash]"
      assert_select "input#semester_bank[name=?]", "semester[bank]"
      assert_select "input#semester_active[name=?]", "semester[active]"
    end
  end
end
