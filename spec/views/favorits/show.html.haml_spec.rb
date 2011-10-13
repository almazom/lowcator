require 'spec_helper'

describe "favorits/show.html.haml" do
  before(:each) do
    @favorit = assign(:favorit, stub_model(Favorit,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
