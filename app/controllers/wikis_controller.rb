class WikisController < ApplicationController
  layout "wiki"

  def index
    @wikis = Wiki.all
    @page_title = "Blocipedia Wikis"
  end

  def show
    @wiki = Wiki.find(params[:id])
    @page_title = @wiki.title
  end

  def new
    @wiki = Wiki.new
    @page_title = "Blocipedia Wikis"
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @page_title = @wiki.title
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to @wiki
    else
      flash[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was successfully updated."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error saving the wiki update. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "Wiki was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end
      

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end