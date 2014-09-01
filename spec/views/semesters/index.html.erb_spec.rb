require 'spec_helper'

describe "semesters/index" do
  before(:each) do
    assign(:semesters, [
      stub_model(Semester,
        :cash => 1.5,
        :bank => 1.5,
        :active => false
      ),
      stub_model(Semester,
        :cash => 1.5,
        :bank => 1.5,
        :active => false
      )
    ])
  end

  it "renders a list of semesters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
