require 'spec_helper'

describe "rows/show" do
  before(:each) do
    @row = assign(:row, stub_model(Row,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
