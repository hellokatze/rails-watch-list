class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[new create edit update]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: "Bookmark successfully deleted!"
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @bookmark.list = @list
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_bookmark
    @list = List.find(params[:list_id])
  end
end
