require 'spec_helper'

describe "entities/index" do
  before(:each) do
    assign(:entities, [
      stub_model(Entity,
        :entity_name => "Entity Name"
      ),
      stub_model(Entity,
        :entity_name => "Entity Name"
      )
    ])
  end

  it "renders a list of entities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Entity Name".to_s, :count => 2
  end
end
