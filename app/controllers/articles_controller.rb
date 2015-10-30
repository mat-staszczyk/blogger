class ArticlesController < ApplicationController
  before_filter :require_login, except: [:index, :show, :popular]
  include ArticlesHelper

  def popular
    @articles = Article.all.sort { |x,y| y.view_count <=> x.view_count }.slice(0,3)
  end

  def index
    @articles = Article.all

    respond_to do |format|
      format.xml { render xml: @articles }
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.view_count += 1
    @article.save
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new    
  end

  def create
    @article = Article.create(article_params)
    flash.notice = "Article '#{@article.title}' created!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' has been deleted."

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' updated!"

    redirect_to article_path(@article)
  end

end
