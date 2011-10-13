class Link < ActiveRecord::Base

  belongs_to :user
  #acts_as_taggable_on :tags
  has_many :favorits


end
