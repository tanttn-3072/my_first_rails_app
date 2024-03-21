class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end
 
  # POST /articles or /articles.json
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end  
    #redirect_to action: "index"
   
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end    
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!
    redirect_to articles_path #redirect to inđex path, check the routes and see the link (first row)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:tilte, :description)
    end
end
