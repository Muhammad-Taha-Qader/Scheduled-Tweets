class RegistrationController <ApplicationController
  def new
    @user = User.new # that will look at the database tables and attributes that we have in our user model and it will create a new one in memory and it will just assign it to a instance variable @user
    # and we're using an instance variable here instead of a regular variable like user without the at symbol because in ruby this local variable will only be available inside of this method and then it will just get garbage collected and removed you won't be able to use it anywhere else when we do an instance variable this is actually going to be visible in our views so when we create our app views we'll need a folder here called registrations inside of there we'll make the matching new.html.erp and we'll add our h1 for sign up and we can actually print out at user here in the browser so this instance variable gets assigned and it's visible and viewable and usable inside of your view
  end

  def create
    # 'prams' will give: {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"[FILTERED]", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
    #  params[:user]  -> {"email"=>"[FILTERED]", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    # @user = User.new(prams[:user])  it will create new user but we sould restrict which variables are being passed
    @user = User.new(user_params)
    if @user.save
      # cookies[:user_id] # so when a user successfully gets created in the database we actually need to sign them in right now we're going to redirect them back to the home page the root path but we're not going to sign them in at all and that is a problem so the way to do this is actually to set a cookie to keep track of the user being signed in now we can access our cookies by saying cookies and we can give a cookie a name and say user id is whatever but if we were to do that that is going to be something anybody can do and change their user id that they're logged in as that would be very very bad
      session[:user_id] = @user.id # this is something that can be set server side but browsers can never tamper with that so nobody can mess with this and we can use that id on the next request to check to see if the user is logged in
      redirect_to root_path, notice: "Account created successfully"
    else
      # flash[:alert] = "Something was wrong"
      # redirect_to sign_up_path, alert: "Something was wrong"
      # redirect_to sign_up_path

      # render :new  # keeps the @user object in memory with all its validation errors, whereas redirect_to initiates a new request and reloads the page, losing the error messages associated with the @user instance.
      puts "ERROR: User registration failed"
      puts @user.errors.full_messages
      redirect_back fallback_location: root_path, alert: @user.errors.full_messages  # shows flash notic as ["Password confirmation doesn't match Password", "Email Must be a valid Email Address"]   Updated flash view to handle array if errors are in array if not do what it was doing previously
      # redirect_back fallback_location: root_path, alert: @user.errors.full_messages.join("<br />").html_safe  # shows flash notic as Password confirmation doesn't match Password<br />Email Must be a valid Email Address
    end
    # puts "Create action was called"
    # logger.debug "Create action was called with params: #{params[:user].inspect}" # Logs detailed info
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
