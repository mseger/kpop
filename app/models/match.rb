class Match < ActiveRecord::Base
  attr_accessible :user_id, :matchee_id, :matchee_name, :type, :starred

  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :matchee_id
  validates_presence_of :type
  validates_uniqueness_of :matchee_id, :scope => :user_id

  scope :starred, where(starred: true)
end