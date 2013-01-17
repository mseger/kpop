class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid, :company, :cleanliness, :house_parties, :loudness, :about

  has_many :matches
  has_many :matchees, through: :matches

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

  def starred_matchees
    self.matches.starred.map do |starred_match|
      starred_match.matchee
    end
  end
end
