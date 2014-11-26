# Activeadmin Poro Decorator

Alternative for draper, if you need decorators at ActiveAdmin (and Rails).
Active Admin uses of Draper gem for [decorators](http://activeadmin.info/docs/11-decorators.html), but sometimes you don't need that.
For reasons you could read this article: http://thepugautomatic.com/2014/03/draper.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activeadmin-poro-decorator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activeadmin-poro-decorator

## Usage

```ruby
# app/admin/post.rb
ActiveAdmin.register Post do
  decorate_with PostDecorator

  permit_params :title

  index do
    column :id
    column :title
    column :hello       #delegated
    column :link_title  #delegated
  end
end

# app/presenters/post_decorator.rb
class PostDecorator < DelegateClass(Post)
  include ActiveadminPoroDecorator

  def self.model_name
    ActiveModel::Name.new Post
  end

  def self.columns
    Post.columns
  end

  def hello
    "Hello, #{title}"
  end

  def link_title
    helpers.link_to(id, url_helpers.admin_post_path(self))
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/poroaa/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
