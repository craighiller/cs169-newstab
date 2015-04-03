require 'spec_helper'

describe "groups/show" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :user_id => 1,
      :group_name => "Group Name",
      :private => false,
      :subscribers_only => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Group Name/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
