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
      street_address: params[:street_address],
      email: params[:email],
      phone_number: params[:phone_number],
      password: params[:password],
      password_confirmation: params[:password_confirmation],

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

  def update
    @user = User.find_by(id: params[:id])

    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.street_address = params[:street_address] || @user.street_address
    @user.email = params[:email] || @user.email
    @user.phone_number = params[:phone_number] || @user.phone_number
    @user.password = params[:password] || @user.password

    @user.save
    render "show.json.jb"
  end

  #*****************dec 4 2020 today i ended by cheking if my update function is working   so far bearly started to look into it

  def destroy
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    @user.destroy
    render json: { message: "User is now deleted!" }
  end
end
