class UsersController < ApplicationController
    # before_action :require_logged_out, only: [:new, :create]
    # before_action :require_logged_in, only: [:index, :show, :edit, :update, :destroy] 
    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def create
        @user = User.create!(email: params[:user][:email], password: params[:user][:password])

        if @user.save
            login!(@user)
            redirect_to user_url(@user)

        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end