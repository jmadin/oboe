require 'spec_helper'

describe Project do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @project = Project.new(content: "Lorem ipsum", user_id: user.id)
  end
  
  subject { @project }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  describe "when user_id is not present" do
    before { @project.user_id = nil }
    it { should_not be_valid }
  end
  describe "when user_id is not present" do
    before { @project.user_id = nil }
    it { should_not be_valid }
  end
    
  describe "with blank content" do
    before { @project.content = " " }
    it { should_not be_valid }
  end
  
  describe "with content that is too long" do
    before { @project.content = "a" * 141 }
    it { should_not be_valid }
  end
end