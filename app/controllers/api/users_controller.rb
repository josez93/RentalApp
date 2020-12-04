class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render "index.json.jb"
  end

  # def new
  #   render "new.html"
  # end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      Street_address: params[:Street_address],
      email: params[:email],
      phone_number: params[:phone_number],
      #password: params[:password], need to add password in schema

    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @users = User.all
    render "show.html.erb"
  end

  # def update
  #   @users = current_user
  #     first_name: params[:first_name] || @user.first_name,
  #     last_name: params[:last_name]|| @user.last_name,
  #     street_address: params[:street_address]|| @user.street_address,
  #     email: params[:email]|| @user.email,
  #     phone_number: params[:phone_number]|| @user.phone_number,
  #     password: params[:password]|| @user.password,
  #   @users.save
  #   render "show.json.jb"
  # end
  #*****************dec 4 2020 today i ended by cheking if my update function is working   so far bearly started to look into it

  def destroy
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    @user.destroy
    render json: { message: "User is now deleted!" }
  end
end
