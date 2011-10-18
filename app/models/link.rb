class Link < ActiveRecord::Base
  belongs_to :user
  has_many :favorits
  has_many :comments
  default_scope order("created_at DESC")
end
