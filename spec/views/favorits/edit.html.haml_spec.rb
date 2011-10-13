require 'spec_helper'

describe "favorits/edit.html.haml" do
  before(:each) do
    @favorit = assign(:favorit, stub_model(Favorit,
      :user_id => 1
    ))
  end

  it "renders the edit favorit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => favorits_path(@favorit), :method => "post" do
      assert_select "input#favorit_user_id", :name => "favorit[user_id]"
    end
  end
end
