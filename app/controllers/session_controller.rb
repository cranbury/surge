class SessionController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def create
    # find if any user has that email
    user = User.find_by(email: params[:email])

    # if that user exists and it has a password that
    # was sent
    if user && ( user.authenticate(params[:password]) )
      # save the user_id in the session hash
      login(user)
      flash[:notice] = "Welcome back, #{user.email}!"
      # and redirect to that user's home page
      redirect_to ( user_path(current_user) )
    else
      # the email/password is wrong!
      flash[:notice] = "Failed Login. Try again."
      redirect_to login_path
    end
  end

  def destroy
    logout
    authenticate!
  end

end