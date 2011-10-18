class Comment < ActiveRecord::Base
  belongs_to :link, :dependent => :destroy
end
