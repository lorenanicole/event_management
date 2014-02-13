class Event < ActiveRecord::Base

  has_many :event_attendances
  has_many :users, through: :event_attendances

  belongs_to :creator, :class_name=> 'User', :foreign_key => 'creator_id'
end
