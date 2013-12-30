require 'spec_helper'

describe "observations/show" do
  before(:each) do
    @observation = assign(:observation, stub_model(Observation,
      :project => nil,
      :entity => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
