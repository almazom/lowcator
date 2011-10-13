require 'spec_helper'

describe "favorits/new.html.haml" do
  before(:each) do
    assign(:favorit, stub_model(Favorit,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new favorit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => favorits_path, :method => "post" do
      assert_select "input#favorit_user_id", :name => "favorit[user_id]"
    end
  end
end
