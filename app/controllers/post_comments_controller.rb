class PostCommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    # ローカル変数 = モデルを指定し.固有の[idカラム]を取得し(find)どの投稿にコメントをするか決める
    comment = current_user.post_comments.new(post_comment_params)
    # ローカル変数 = 現在ログイン中のユーザーが.PostCommentモデル.の新しいインスタンスを作成
    comment.post_image_id = post_image.id
    # PostComment.newのpost_image_idカラムと最初に取得したPostImageモデル固有のIDを結びつける
    comment.save
    # アクションを実行
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy　#省略系
    redirect_to post_image_path(params[:post_image_id])
  end
  
  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
