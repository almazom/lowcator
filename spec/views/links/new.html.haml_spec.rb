require 'spec_helper'

describe "links/new.html.haml" do
  before(:each) do
    assign(:link, stub_model(Link,
      :title => "MyString",
      :description => "MyText",
      :url => "MyString",
      :url_thumbnail_path => "MyString",
      :tag_list => "MyString",
      :published => false
    ).as_new_record)
  end

  it "renders new link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => links_path, :method => "post" do
      assert_select "input#link_title", :name => "link[title]"
      assert_select "textarea#link_description", :name => "link[description]"
      assert_select "input#link_url", :name => "link[url]"
      assert_select "input#link_url_thumbnail_path", :name => "link[url_thumbnail_path]"
      assert_select "input#link_tag_list", :name => "link[tag_list]"
      assert_select "input#link_published", :name => "link[published]"
    end
  end
end
