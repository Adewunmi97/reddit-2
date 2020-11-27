class CommentsController < ApplicationController
include CommentsHelper

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.body = params[:comment][:body]
    @comment.user_id = params[:comment][:user_id]
    @comment.post_id = params[:comment][:post_id]
    @comment.save

    flash.notice = "Comment '#{@comment.body}' Created!"

    redirect_to comments_path(@comment)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    flash.notice = "Comment '#{@comment.body}' Deleted!"

    redirect_to comments_path(@comment)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    flash.notice = "Comment '#{@comment.body}' Updated!"

    redirect_to comments_path(@comment)
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
