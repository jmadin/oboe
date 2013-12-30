require 'spec_helper'

describe "contexts/new" do
  before(:each) do
    assign(:context, stub_model(Context,
      :project => nil,
      :observation => nil,
      :has_context => nil
    ).as_new_record)
  end

  it "renders new context form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contexts_path, "post" do
      assert_select "input#context_project[name=?]", "context[project]"
      assert_select "input#context_observation[name=?]", "context[observation]"
      assert_select "input#context_has_context[name=?]", "context[has_context]"
    end
  end
end
