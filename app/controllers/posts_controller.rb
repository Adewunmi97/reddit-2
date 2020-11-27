class PostsController < ApplicationController
    def index
        @posts = Post.all
      end

      def show
        @post = Post.find(params[:id])
      end

      def new
        @post = Post.new
      end

      def create
        @post = Post.new(post_params)
        @post.name = params[:post][:name]
        @post.body = params[:post][:body]
        @post.user_id = params[:post][:user_id]
        @post.save

        flash.notice = "Post '#{@post.name}' Created!"

        redirect_to posts_path(@post)
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy

        flash.notice = "Post '#{@post.name}' Deleted!"

        redirect_to posts_path(@post)
      end

      def edit
        @post = Post.find(params[:id])
      end

      def update
        @post = Post.find(params[:id])
        @post.update(post_params)

        flash.notice = "Post '#{@post.name}' Updated!"

        redirect_to posts_path(@post)
      end
      private

      def post_params
        params.require(:post).permit(:name, :body, :user_id)
      end
end
