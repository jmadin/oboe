require 'spec_helper'

describe "points/edit" do
  before(:each) do
    @point = assign(:point, stub_model(Point,
      :row => nil,
      :measurement => nil,
      :value => "MyString"
    ))
  end

  it "renders the edit point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", point_path(@point), "post" do
      assert_select "input#point_row[name=?]", "point[row]"
      assert_select "input#point_measurement[name=?]", "point[measurement]"
      assert_select "input#point_value[name=?]", "point[value]"
    end
  end
end
