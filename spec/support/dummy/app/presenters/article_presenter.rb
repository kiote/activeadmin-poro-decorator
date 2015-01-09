# inspired by https://github.com/activeadmin/activeadmin/blob/a180c76f17480715948bff2ead827f338d95a835/spec/support/templates/post_decorator.rb
class ArticlePresenter < DelegateClass(Article)
  include ActiveadminPoroDecorator

  class << self
    delegate :all, :arel_table, :find_by_sql, :columns, :connection,\
             :unscoped, :table_name, :primary_key, to: Article

    def model_name
      ActiveModel::Name.new Article
    end
  end
  
  def hello
    "Hello, #{title}"
  end

  def link_title
    helpers.link_to(id, url_helpers.admin_article_path(self))
  end
end