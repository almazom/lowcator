class User < ActiveRecord::Base
  include ActiveModel::Dirty
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :links
  has_many :favorits

  before_save :check_changed_or_not_is_admin?


  def full_name
    if !self.name.nil?
      self.name
    else
      self.email
    end

  end

  private
  def check_changed_or_not_is_admin?

    p '1111111111111111'
    p self.is_admin_changed?
    p '1111111111111111'
  end
end