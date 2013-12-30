require 'spec_helper'

describe "traits/index" do
  before(:each) do
    assign(:traits, [
      stub_model(Trait,
        :trait_name => "Trait Name"
      ),
      stub_model(Trait,
        :trait_name => "Trait Name"
      )
    ])
  end

  it "renders a list of traits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Trait Name".to_s, :count => 2
  end
end
