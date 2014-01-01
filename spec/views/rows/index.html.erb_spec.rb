require 'spec_helper'

describe "rows/index" do
  before(:each) do
    assign(:rows, [
      stub_model(Row,
        :project => nil
      ),
      stub_model(Row,
        :project => nil
      )
    ])
  end

  it "renders a list of rows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
