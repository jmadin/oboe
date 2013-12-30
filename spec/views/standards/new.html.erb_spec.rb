require 'spec_helper'

describe "standards/new" do
  before(:each) do
    assign(:standard, stub_model(Standard,
      :standard_name => "MyString"
    ).as_new_record)
  end

  it "renders new standard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", standards_path, "post" do
      assert_select "input#standard_standard_name[name=?]", "standard[standard_name]"
    end
  end
end
