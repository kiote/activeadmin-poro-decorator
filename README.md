# Activeadmin Poro Decorator

![](https://travis-ci.org/kiote/activeadmin-poro-decorator.svg?branch=master)

Alternative for draper, if you need decorators at ActiveAdmin (and Rails).
Active Admin uses the Draper gem for [decorators](http://activeadmin.info/docs/11-decorators.html), but sometimes you don't need that.
For reasons you could read this article: http://thepugautomatic.com/2014/03/draper.

See discussion of PORO with Active Admin authors [here](https://github.com/activeadmin/activeadmin/issues/3600).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activeadmin-poro-decorator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activeadmin-poro-decorator

Then run rake-task to copy config file:

    $ rake config:copy

Finally, rename activeadmin-poro-decorator.yml.sample to activeadmin-poro-decorator.yml:

    $ mv config/activeadmin-poro-decorator.yml.example config/activeadmin-poro-decorator.yml

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

  def hello
    "Hello, #{title}"
  end

  def link_title
    helpers.link_to(id, url_helpers.admin_post_path(self))
  end
end
```

For more examples have a look to [sample app](https://github.com/kiote/aa_plus_poro)

## Credits
![](http://d3a5orex94acl6.cloudfront.net/assets/logo-sprites-a6de3b3521c14ee436ca3207d83cdf90.png)

Activeadmin-poro-decorator is created with support of [Legelisten.no](http://www.legelisten.no/om-oss)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/activeadmin-poro-decorator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
