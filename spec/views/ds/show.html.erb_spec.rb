require 'spec_helper'

describe "ds/show" do
  before(:each) do
    @d = assign(:d, stub_model(D,
      :measurement => nil,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Value/)
  end
end
