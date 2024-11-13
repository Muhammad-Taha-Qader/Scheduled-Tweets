class SessionsController <ApplicationController
  def destroy
    session[:user_id]=nil
    redirect_to about_path, notice: "Logged Out"
  end

  def new
  end
  def create
    user = User.find_by(email: params[:email]) # No need to make @user here
    if user.present? && user.authenticate(params[:password]) # 'authenticate' method comes from our models/user.r 'has_secure_password '
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged In Successfully"
    else
      # render :new
      # flash[:alert] = "Invalid email or password"
      # # $$rails render vs redirect
      # # https://medium.com/@kerenlerner/render-and-redirect-which-to-use-106ff653ee9a
      redirect_back fallback_location: root_path, alert: "Invalid email or password"
    end
  end
end
