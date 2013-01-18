class Match < ActiveRecord::Base
  attr_accessible :matchee_id, :type, :user_id, :starred

  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :matchee_id
  validates_presence_of :type
  validates_uniqueness_of :matchee_id, :scope => :user_id

  scope :starred, where(starred: true)
end