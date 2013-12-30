require 'spec_helper'

describe "standards/edit" do
  before(:each) do
    @standard = assign(:standard, stub_model(Standard,
      :standard_name => "MyString"
    ))
  end

  it "renders the edit standard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", standard_path(@standard), "post" do
      assert_select "input#standard_standard_name[name=?]", "standard[standard_name]"
    end
  end
end
