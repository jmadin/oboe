require 'spec_helper'

describe "traits/new" do
  before(:each) do
    assign(:trait, stub_model(Trait,
      :trait_name => "MyString"
    ).as_new_record)
  end

  it "renders new trait form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", traits_path, "post" do
      assert_select "input#trait_trait_name[name=?]", "trait[trait_name]"
    end
  end
end
