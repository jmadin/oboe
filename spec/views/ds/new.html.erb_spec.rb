require 'spec_helper'

describe "ds/new" do
  before(:each) do
    assign(:d, stub_model(D,
      :measurement => nil,
      :value => "MyString"
    ).as_new_record)
  end

  it "renders new d form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ds_path, "post" do
      assert_select "input#d_measurement[name=?]", "d[measurement]"
      assert_select "input#d_value[name=?]", "d[value]"
    end
  end
end
