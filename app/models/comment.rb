class Comment < ActiveRecord::Base
  belongs_to :link, :dependent => :destroy
  default_scope order("created_at DESC")
end
