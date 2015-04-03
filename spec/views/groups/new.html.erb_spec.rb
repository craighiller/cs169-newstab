require 'spec_helper'

describe "groups/new" do
  before(:each) do
    assign(:group, stub_model(Group,
      :user_id => 1,
      :group_name => "MyString",
      :private => false,
      :subscribers_only => false
    ).as_new_record)
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", groups_path, "post" do
      assert_select "input#group_user_id[name=?]", "group[user_id]"
      assert_select "input#group_group_name[name=?]", "group[group_name]"
      assert_select "input#group_private[name=?]", "group[private]"
      assert_select "input#group_subscribers_only[name=?]", "group[subscribers_only]"
    end
  end
end
