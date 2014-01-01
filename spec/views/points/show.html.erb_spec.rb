require 'spec_helper'

describe "points/show" do
  before(:each) do
    @point = assign(:point, stub_model(Point,
      :row => nil,
      :measurement => nil,
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
