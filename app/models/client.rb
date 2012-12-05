class Client < ActiveRecord::Base
  attr_accessible :avatar, :remote_avatar_url, :company, :email, :first_name, :last_name, :password, :password_confirmation
  
  has_many :projects
  
  validates :first_name, :length => { :minimum => 2 }
  validates :last_name, :length => { :minimum => 2 }

  validates :email,
            :uniqueness => true,
            :email_format => true
  
  validates :password, :length => { :in => 6..20 }
  
  has_secure_password
  mount_uploader :avatar, ImageUploader
  
end
