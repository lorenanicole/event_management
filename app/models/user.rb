require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :email, uniqueness: true, presence: true, :format => { :with => /.+@\w+\.\w{2,4}/ }
  validates :password, presence: true
  validates :password, presence: true

  has_many :attended_events, :class_name => "EventAttendance", :foreign_key => "user_id"

  has_many :created_events, :class_name => "Event", :foreign_key => "creator_id"

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
