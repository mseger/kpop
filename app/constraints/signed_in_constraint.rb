class SignedInConstraint
  def self.matches?(request)
    !request.session[:user_id].nil?
  end
end