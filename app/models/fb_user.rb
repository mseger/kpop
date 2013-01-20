class FbUser

  def initialize(uid)
    @uid = uid
  end

  def id
    self.uid
  end

  def uid
    @uid
  end

  def name
    @name ||= User.fb_graph.get_object("#{self.uid}?fields=name")["name"]
  end

  def location_id
    unless @location_id
      user_hash = User.fb_graph.get_object("#{self.uid}?fields=location")
      if user_hash.has_key?("location")
        @location_id = user_hash["location"]["id"]
        @location_name = user_hash["location"]["name"]
      end
    end
    @location_id
  end
 
  def location_name
    unless @location_name
      self.location_id # Generates @location_name
    end
    @location_name
  end

  def inspect
    "FbUser(id: #{id}, uid: #{uid})"
  end

end