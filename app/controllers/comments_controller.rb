class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.content = comment_params[:content]
    comment.topic_id = params[:topic_id]
     if comment.save
       redirect_to topic_path(id: comment.topic_id), notice: 'コメントを投稿しました'
     else
       redirect_to topic_path(params[:topic_id]), notice: 'コメントの投稿に失敗しました'
     end
   end

  def comment_params
   params.require(:comment).permit(:content)
  end

 end
