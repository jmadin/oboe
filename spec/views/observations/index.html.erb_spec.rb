require 'spec_helper'

describe "observations/index" do
  before(:each) do
    assign(:observations, [
      stub_model(Observation,
        :project => nil,
        :entity => nil
      ),
      stub_model(Observation,
        :project => nil,
        :entity => nil
      )
    ])
  end

  it "renders a list of observations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
