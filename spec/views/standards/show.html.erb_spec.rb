require 'spec_helper'

describe "standards/show" do
  before(:each) do
    @standard = assign(:standard, stub_model(Standard,
      :standard_name => "Standard Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Standard Name/)
  end
end
