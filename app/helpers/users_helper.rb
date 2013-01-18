module UsersHelper

  def fb_prof_image(user)
    "http://graph.facebook.com/#{user.uid}/picture?type=large"
  end

end
