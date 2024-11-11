class SessionsController <ApplicationController
  def destroy
    session[:user_id]=nil
    redirect_to about_path, notice: "Logged Out"
  end
end
