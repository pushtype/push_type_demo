class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # The following filters can be defined in the ApplicationController
  # to execute code around the node render action.
  #
  #   before_node_load    => called before the node instance is loaded
  #   before_node_action  => called after the node instance is laoded, but before the template is rendered
  #   after_node_action   => called after the template is rendered
  #
  # The code to execute can be defined either as a method (pass the
  # method name as the first argument), or alternatively as a block.
  #
  # The options :only and :except can be used to control which node
  # types the filters are called on.

  before_node_action :load_side_panel_content, except: :page

  before_node_action only: :article_list do
    @articles = @node.children.published.page(params[:page]).per(10)
  end

  before_node_action only: :category do
    @articles = Article.published.in_category(@node).order(['published_at DESC', 'created_at DESC']).page(params[:page]).per(10)
  end

  private

  def load_side_panel_content
    @pages = Page.published.all
    @recent_articles = Article.published.limit(5)
    @categories = Category.published.all
  end

end
