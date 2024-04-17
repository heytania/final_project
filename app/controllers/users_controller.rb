class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:email, :encrypted_password, :first_name, :last_name, :postal_code, :city, :address, :province_id)
  end
end
