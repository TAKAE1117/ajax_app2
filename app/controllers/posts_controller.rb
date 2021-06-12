class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def checked
    post = Post.find(params[:id])
    if post.checked               #既読であるか否かを判定するプロパティを指定する
      post.update(checked: false) #既読を解除するためにfalseへ変更
    else
      post.upate(checked: true)   #既読にするためtrueへ変更
    end

    item = Post.find(params[:id]) #レコードを取得
    render json: { post: item }   #JSON形式としてchecked.jsに返却
  end
end