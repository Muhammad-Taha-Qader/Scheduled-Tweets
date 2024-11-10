class MainController <ApplicationController
  def index
    # flash is from ApplicationController
    # flash[:notice] = "Logged in Successfully"  # and it store this message in flash hash object and it's GLOBALLY avliable in our application
    # flash[:alert] = "Invalid email or password"
    # flash[:alert].now = "Invalid email or password"   '.now' to only display on current request
    # No point of saving them if not printed on screen, so we will make a partial view _flash
  end
end
