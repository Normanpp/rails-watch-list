class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit destroy ]

  # GET /bookmarks or /bookmarks.json
  def index
    @bookmarks = Bookmark.all
  end

  # GET /bookmarks/1 or /bookmarks/1.json
  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    redirect_to list_path(@bookmark.list)
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: "Bookmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
