require 'spec_helper'

describe "standards/index" do
  before(:each) do
    assign(:standards, [
      stub_model(Standard,
        :standard_name => "Standard Name"
      ),
      stub_model(Standard,
        :standard_name => "Standard Name"
      )
    ])
  end

  it "renders a list of standards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Standard Name".to_s, :count => 2
  end
end
