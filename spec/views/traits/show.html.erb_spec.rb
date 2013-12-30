require 'spec_helper'

describe "traits/show" do
  before(:each) do
    @trait = assign(:trait, stub_model(Trait,
      :trait_name => "Trait Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Trait Name/)
  end
end
