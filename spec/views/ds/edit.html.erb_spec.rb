require 'spec_helper'

describe "ds/edit" do
  before(:each) do
    @d = assign(:d, stub_model(D,
      :measurement => nil,
      :value => "MyString"
    ))
  end

  it "renders the edit d form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", d_path(@d), "post" do
      assert_select "input#d_measurement[name=?]", "d[measurement]"
      assert_select "input#d_value[name=?]", "d[value]"
    end
  end
end
