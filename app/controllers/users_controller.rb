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

  def admin
    authorize! :manage, current_user
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def change_admin
    authorize! :manage, current_user
    user = User.find_by_id(params[:id])
    user.update_attributes(:role => "admin")
    current_user.update_attributes(:role => "user")
    respond_to do |format|
      format.html { redirect_to space_vehicles_url, notice: 'Admin changed successfully.' }
    end
  end

  def delete_user
    authorize! :destroy, current_user
    @user = User.find_by_id(params[:id])

    @user.destroy

    respond_to do |format|
      format.html { redirect_to "/users/admin", notice: 'User deleted successfully.' } 
      format.json { head :no_content }
    end
  end

end
