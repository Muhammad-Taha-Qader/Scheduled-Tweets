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
      redirect_to root_path, notice: "Account created successfully"
    else
      # flash[:alert] = "Something was wrong"
      render :new
    end
    # puts "Create action was called"
    # logger.debug "Create action was called with params: #{params[:user].inspect}" # Logs detailed info
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
