require 'spec_helper'

describe "links/index.html.haml" do
  before(:each) do
    assign(:links, [
      stub_model(Link,
        :title => "Title",
        :description => "MyText",
        :url => "Url",
        :url_thumbnail_path => "Url Thumbnail Path",
        :tag_list => "Tag List",
        :published => false
      ),
      stub_model(Link,
        :title => "Title",
        :description => "MyText",
        :url => "Url",
        :url_thumbnail_path => "Url Thumbnail Path",
        :tag_list => "Tag List",
        :published => false
      )
    ])
  end

  it "renders a list of links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url Thumbnail Path".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tag List".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
