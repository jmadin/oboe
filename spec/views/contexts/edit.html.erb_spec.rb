require 'spec_helper'

describe "contexts/edit" do
  before(:each) do
    @context = assign(:context, stub_model(Context,
      :project => nil,
      :observation => nil,
      :has_context => nil
    ))
  end

  it "renders the edit context form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", context_path(@context), "post" do
      assert_select "input#context_project[name=?]", "context[project]"
      assert_select "input#context_observation[name=?]", "context[observation]"
      assert_select "input#context_has_context[name=?]", "context[has_context]"
    end
  end
end
