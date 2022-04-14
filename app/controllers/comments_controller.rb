class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    correct_user
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_url
    end
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :snap_id)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
