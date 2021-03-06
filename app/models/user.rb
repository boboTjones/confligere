class User < ActiveRecord::Base
  attr_accessor :password
  has_many :expectations, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :journals
  
  before_save :encrypt_password
  
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :message => "Password confirmation must match!"
  validates_uniqueness_of :username
  
  def self.authenticate(username, password)
    u = find_by_username(username)
    if u && u.password_hash == BCrypt::Engine.hash_secret(password, u.password_salt)
      u
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
end

