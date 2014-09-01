require 'spec_helper'

describe "semesters/show" do
  before(:each) do
    @semester = assign(:semester, stub_model(Semester,
      :cash => 1.5,
      :bank => 1.5,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/false/)
  end
end
