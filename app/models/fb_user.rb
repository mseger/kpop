class FbUser

  def initialize(uid, name)
    @uid = uid
    @name = name
  end

  def id
    self.uid
  end

  def uid
    @uid
  end

  def name
    @name
  end

  def inspect
    "FbUser(id: #{id}, uid: #{uid})"
  end

end