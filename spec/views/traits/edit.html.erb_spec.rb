require 'spec_helper'

describe "traits/edit" do
  before(:each) do
    @trait = assign(:trait, stub_model(Trait,
      :trait_name => "MyString"
    ))
  end

  it "renders the edit trait form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trait_path(@trait), "post" do
      assert_select "input#trait_trait_name[name=?]", "trait[trait_name]"
    end
  end
end
