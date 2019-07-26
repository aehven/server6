Warden::Manager.after_set_user except: :fetch do |user, auth, opts|
  user.after_sign_in_callback
end
