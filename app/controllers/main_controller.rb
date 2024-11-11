class MainController <ApplicationController
  def index
    # flash is from ApplicationController
    # flash[:notice] = "Logged in Successfully"  # and it store this message in flash hash object and it's GLOBALLY avliable in our application
    # flash[:alert] = "Invalid email or password"
    # flash[:alert].now = "Invalid email or password"   '.now' to only display on current request
    # No point of saving them if not printed on screen, so we will make a partial view _flash
    if session[:user_id]
      # @user = User.find(session[:user_id]) # as long as the number is set and it's not nil we can look the user up , and our main view ie: main/index we can print out @user value
      # If using @user = User.find(session[:user_id]) and u sign up and come on home page it will show u user id, but if you come at 'rails c' and do User.last.destroy, browser will throw error RecordNotFound in MainController#index, so we will use find_by that if rec is not there don't show error just logout
      @user = User.find_by(id: session[:user_id])  # when it can't find the user so in this case we deleted the user and our cookies think we're still attached to that user and logged in but our rails app now is smart enough to say yeah you had a user account before but it doesn't exist anymore and so we're going to leave it alone and you're not going to be logged in because we can't find that user and that way our application does not crash which we never want to have happen in production and it still treats it the same as a logged out user so that is how we can sign in our users with session cookies
    end
  end
end
