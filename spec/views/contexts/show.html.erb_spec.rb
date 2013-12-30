require 'spec_helper'

describe "contexts/show" do
  before(:each) do
    @context = assign(:context, stub_model(Context,
      :project => nil,
      :observation => nil,
      :has_context => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
