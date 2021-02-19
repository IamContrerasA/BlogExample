class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  #skip_before_action :verify_authenticity_token #in case csrf token not work
  
  def index
    articles = Article.all
    @public_articles = []
    @private_articles = []
    @achieved_articles =[]
    articles.each do |article|
      case article.status
      when 'public'
        @public_articles.push(article)
      when 'private'
        @private_articles.push(article)
      else
        @achieved_articles.push(article)
      end
    end
    
  end

  def show
    @article = Article.find(params[:id])
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

  ######################### Custom methods #################
  
  def update_status
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update({status: params[:type]})
        format.json { render json: {'resultado': 'ok' } }
      else
        format.json { render json: {'resultado': 'fail' } }
      end
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
