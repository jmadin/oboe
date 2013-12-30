require 'spec_helper'

describe "contexts/index" do
  before(:each) do
    assign(:contexts, [
      stub_model(Context,
        :project => nil,
        :observation => nil,
        :has_context => nil
      ),
      stub_model(Context,
        :project => nil,
        :observation => nil,
        :has_context => nil
      )
    ])
  end

  it "renders a list of contexts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
