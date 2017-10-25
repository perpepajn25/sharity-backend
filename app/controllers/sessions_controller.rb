class SessionsController < ApplicationController

  def signup
    if params["activeItem"] === "Volunteer"
      @user = User.create(
        username: params["username"],
        password: params["password"],
        email: params["email"],
        phone: params["phone"]
      )

      payload = { user_id: @user.id }
      token = JWT.encode(payload,"helloDavid")
      render json: {user:@user, token: token}
    else
      @charity = Charity.create(
        name: params["username"],
        password: params["password"],
        email: params["email"],
        phone: params["phone"],
        contact: params["contactPerson"],
        description: params["description"],
        url: params["url"]
      )

      payload = { charity_id: @charity.id }
      token = JWT.encode(payload,"helloDavid")
      render json: {charity:@charity, token: token}
    end
  end

  def signin

  end

end
