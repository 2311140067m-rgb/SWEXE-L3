class BookmarksController < ApplicationController
  
  def index
    @bookmarks = Bookmark.all
  end
  
  def new
    @bookmark = Bookmark.new  #formヘルパーのデータの入れ物になる
  end
  
  def create
    
    @bookmark = Bookmark.new(bookmark_params)
    
    if @bookmark.save
        flash[:notice] = '１レコード追加しました'
        redirect_to '/'
    else
        render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    redirect_to '/'
  end
  
  def show
    @bookmark = Bookmark.find(params[:id])
  end
  
  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  
  def update
    bookmark = Bookmark.find(params[:id])
    bookmark.update(title: params[:bookmark][:title], url: params[:bookmark][:url])
    redirect_to '/'
  end
  
  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :author)
  end


end
