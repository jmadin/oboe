require 'spec_helper'

describe "observations/new" do
  before(:each) do
    assign(:observation, stub_model(Observation,
      :project => nil,
      :entity => nil
    ).as_new_record)
  end

  it "renders new observation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", observations_path, "post" do
      assert_select "input#observation_project[name=?]", "observation[project]"
      assert_select "input#observation_entity[name=?]", "observation[entity]"
    end
  end
end
