require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :email, uniqueness: true, presence: true, :format => { :with => /.+@\w+\.\w{2,4}/ }
  validates :password, presence: true
  validates :password, presence: true

  has_many :event_attendances
  has_many :events, through: :event_attendances

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    return false if @user.nil?
    @user.password == password ? @user : false
  end

end
