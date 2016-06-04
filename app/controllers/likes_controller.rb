class LikesController < ApplicationController

   def create
   	@post = Post.find(params[:post_id])
   	@like = current_user.likes.build(post_id: @post.id)
   	if @like.save
   		redirect_to posts_path,notice:"いいねしました"
   	else
   	    redirect_to posts_path, alert: "いいねできませんでした"
   end
end

   def destroy
       @like = current_user.likes.find_by!(post_id: params[:post_id])
       @like.destroy
       redirect_to posts_path, notice: "お気に入りをしました"
   end    	

end
