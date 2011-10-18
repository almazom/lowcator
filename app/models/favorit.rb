class Favorit < ActiveRecord::Base
  has_and_belongs_to_many :links
  belongs_to :users
end
