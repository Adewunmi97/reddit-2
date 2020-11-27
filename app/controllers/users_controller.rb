class UsersController < ApplicationController
    def index
        @users = User.all
      end

      def show
        @user = User.find(params[:id])
      end

      def new
        @user = User.new
      end

      def create
        @user = User.new(user_params)
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.save

        flash.notice = "User '#{@user.name}' Created!"

        redirect_to users_path(@user)
      end

      def destroy
        @user = User.find(params[:id])
        @user.destroy

        flash.notice = "User '#{@user.name}' Deleted!"

        redirect_to users_path(@user)
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        @user.update(user_params)

        flash.notice = "User '#{@user.name}' Updated!"

        redirect_to users_path(@user)
      end

      private

      def user_params
        params.require(:user).permit(:name, :email)
      end
end
