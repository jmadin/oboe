require 'spec_helper'

describe "measurements/show" do
  before(:each) do
    @measurement = assign(:measurement, stub_model(Measurement,
      :observation => nil,
      :trait => nil,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Value/)
  end
end
