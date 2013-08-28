class CommentsController < ApplicationController
def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body))
		@comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'show' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
		end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

		@post = Post.find(params[:post_id])
    
		respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
		end
  end 
end
