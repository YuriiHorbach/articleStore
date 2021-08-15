class ArticlesController < ApplicationController
  def index
    if current_user.subscription_status == "active"
      @articles = Article.all
    else
      @articles = Article.free
    end
  end

  def show
    @article = Article.find(params[:id])
    if @article.premium? && current_user.subscription_status != "active"
      redirect_to articles_path, alert: "Only for active subscribers"
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end


end
