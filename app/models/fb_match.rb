class FbMatch < Match
  belongs_to :matchee, class_name: 'FbUser'

  validates_presence_of :matchee_name

  def matchee
    FbUser.new(self.matchee_id)
  end
end