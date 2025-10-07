class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  
  def new
    @bookmark = Bookmark.new  #formヘルパーのデータの入れ物になる
  end
  
  def create
    @bookmark = Bookmark.new(title: params[:bookmark][:title], url: params[:bookmark][:url], name: params[:bookmark][:name])
    if @bookmark.save
        redirect_to root_path
    else
        render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy # 成功時
        flash[:notice] = '削除に成功しました'
        redirect_to root_path
    else
        render 'destroy', status: :unprocessable_entity
    end
  end
  
  def show
    @bookmark = Bookmark.find(params[:id])
  end
  
  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  
  def update
    bookmark = Bookmark.find(params[:id])
    bookmark.update(title: params[:bookmark][:title], url: params[:bookmark][:url], name: params[:bookmark][:name])
    redirect_to root_path

  end
end