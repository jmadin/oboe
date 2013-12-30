require 'spec_helper'

describe "observations/edit" do
  before(:each) do
    @observation = assign(:observation, stub_model(Observation,
      :project => nil,
      :entity => nil
    ))
  end

  it "renders the edit observation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", observation_path(@observation), "post" do
      assert_select "input#observation_project[name=?]", "observation[project]"
      assert_select "input#observation_entity[name=?]", "observation[entity]"
    end
  end
end
