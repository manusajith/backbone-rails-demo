Example Usage

Create a new rails application called blog.
```
rails new blog
```

Edit your Gemfile and add

```ruby
gem 'rails-backbone'
```

Install the gem and generate scaffolding.

```
bundle install
rails g backbone:install
rails g scaffold Post title:string content:string
rake db:migrate
rails g backbone:scaffold Post title:string content:string
```

You now have installed the backbone-rails gem, setup a default directory structure for your frontend backbone code. Then you generated the usual rails server side crud scaffolding and finally generated backbone.js code to provide a simple single page crud app. You have one last step:

Edit your posts index view app/views/posts/index.html.erb with the following contents:

```html
<div id="posts"></div>

<script type="text/javascript">
  $(function() {
    // Blog is the app name
    window.router = new Blog.Routers.PostsRouter({posts: <%= @posts.to_json.html_safe -%>});
    Backbone.history.start();
  });
</script>
```

If you prefer haml, this is equivalent to inserting the following code into app/views/posts/index.html.haml:

```html
#posts

:javascript
  $(function() {
    // Blog is the app name
    window.router = new Blog.Routers.PostsRouter({posts: #{@posts.to_json.html_safe}});
    Backbone.history.start();
  });
```

Now start your server with `rails s` or your prefered server and browse to `localhost:3000/posts` 

You should now have a fully functioning single page crud app for Post models.
