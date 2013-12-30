require 'spec_helper'

describe "measurements/index" do
  before(:each) do
    assign(:measurements, [
      stub_model(Measurement,
        :observation => nil,
        :trait => nil,
        :value => "Value"
      ),
      stub_model(Measurement,
        :observation => nil,
        :trait => nil,
        :value => "Value"
      )
    ])
  end

  it "renders a list of measurements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
