class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_node_action do
    @pages = Page.published.all
    @recent_articles = Article.published.limit(5)
    @categories = Category.published.all
  end

  before_node_action only: :article_list do
    @articles = @node.children.published.page(params[:page]).per(10)
  end

  before_node_action only: :category do
    @articles = Article.published.in_category(@node).order(['published_at DESC', 'created_at DESC']).page(params[:page]).per(10)
  end

end
