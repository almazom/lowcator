class Link < ActiveRecord::Base
  belongs_to :user
  has_many :favorits
  has_many :comments
  default_scope order("created_at DESC")

  define_index do
    indexes :description

    has user_id
    has favorits.user_id, :as => :favorits_user_id
  end


  before_validation(:on => :create) do
    self.url = 'http://'+url if ! url.include?('http://')
  end

  validates :description, :url, :presence => true
  validates_format_of :url, :with => /(^$)|(^(http):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :on => :create
end
