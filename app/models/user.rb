class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid, :company, :cleanliness, :house_parties, :loudness, :about

  has_many :matches
  has_many :user_matches
  has_many :fb_matches
  has_many :user_matchees, through: :user_matches, source: :matchee
  has_many :fb_matchees, through: :fb_matches, source: :matchee

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    raise(ArgumentError, "Expected an object of class 'User', got #{user.inspect}") unless user.is_a?(User)
    Thread.current[:user] = user
  end

  def self.fb_graph
    User.current.fb_graph if User.current
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.all_but(user)
    User.where("id <> ?", user.id)
  end

  def fb_graph
    Koala::Facebook::API.new(self.oauth_token)
  end

  def matchees
    self.user_matchees + self.fb_matches
  end

end
