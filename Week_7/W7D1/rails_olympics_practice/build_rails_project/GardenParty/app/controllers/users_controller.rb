class UsersController < ApplicationController
  def new # not necessary, pulled from AppCon already
    render :new
  end

  def create
    user = User.create(user_param)
    if user.save
        redirect_to gardens_url
    else
        render :new
    end
  end

  private

  def user_param
    self.params.require(:user).permit(:username)
  end

end
