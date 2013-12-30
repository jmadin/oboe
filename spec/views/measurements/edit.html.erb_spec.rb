require 'spec_helper'

describe "measurements/edit" do
  before(:each) do
    @measurement = assign(:measurement, stub_model(Measurement,
      :observation => nil,
      :trait => nil,
      :value => "MyString"
    ))
  end

  it "renders the edit measurement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", measurement_path(@measurement), "post" do
      assert_select "input#measurement_observation[name=?]", "measurement[observation]"
      assert_select "input#measurement_trait[name=?]", "measurement[trait]"
      assert_select "input#measurement_value[name=?]", "measurement[value]"
    end
  end
end
