class UserMatch < Match
  belongs_to :matchee, class_name: 'User'
end