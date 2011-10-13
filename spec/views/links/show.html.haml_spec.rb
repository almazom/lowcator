require 'spec_helper'

describe "links/show.html.haml" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :title => "Title",
      :description => "MyText",
      :url => "Url",
      :url_thumbnail_path => "Url Thumbnail Path",
      :tag_list => "Tag List",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url Thumbnail Path/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tag List/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
