require 'spec_helper'

describe "searches/show.html.haml" do
  before(:each) do
    @search = assign(:search, stub_model(Search,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
  end
end
