require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :user_id => 1,
      :group_name => "MyString",
      :private => false,
      :subscribers_only => false
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", group_path(@group), "post" do
      assert_select "input#group_user_id[name=?]", "group[user_id]"
      assert_select "input#group_group_name[name=?]", "group[group_name]"
      assert_select "input#group_private[name=?]", "group[private]"
      assert_select "input#group_subscribers_only[name=?]", "group[subscribers_only]"
    end
  end
end
