class FbMatch < Match
  belongs_to :matchee, class_name: 'FbUser'

  def matchee
    FbUser.new(self.matchee_id, self.matchee_name)
  end
end