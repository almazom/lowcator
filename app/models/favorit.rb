class Favorit < ActiveRecord::Base
  has_and_belongs_to_many :links
  belongs_to :users

  #define_index do
  #  indexes :user_id
  #  has user_id, link_id, created_at, updated_at
  #end
end