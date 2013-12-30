require 'spec_helper'

describe "measurements/new" do
  before(:each) do
    assign(:measurement, stub_model(Measurement,
      :observation => nil,
      :trait => nil,
      :value => "MyString"
    ).as_new_record)
  end

  it "renders new measurement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", measurements_path, "post" do
      assert_select "input#measurement_observation[name=?]", "measurement[observation]"
      assert_select "input#measurement_trait[name=?]", "measurement[trait]"
      assert_select "input#measurement_value[name=?]", "measurement[value]"
    end
  end
end
