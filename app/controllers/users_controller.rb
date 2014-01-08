class UsersController < ApplicationController
  before_filter :authenticate_user!

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    # User.create!({:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation] })
    respond_to do |format|
      if @user.save
        format.html { redirect_to :back, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
