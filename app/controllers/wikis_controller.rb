class WikisController < ApplicationController
  layout "wiki"

  #after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index

  def index
    @wikis = policy_scope(Wiki)
    @user = current_user
    @page_title = "Blocipedia Wikis"
  end

  def show
    @wiki = Wiki.find(params[:id])
    @page_title = @wiki.title
    authorize @wiki
  end

  def new
    @wiki =  Wiki.new
    @page_title = "Blocipedia Wikis"
    authorize @wiki
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @page_title = @wiki.title
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    authorize @wiki
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
    authorize @wiki
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
    authorize @wiki
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
