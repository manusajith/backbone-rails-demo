class Blog.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    content: null

class Blog.Collections.PostsCollection extends Backbone.Collection
  model: Blog.Models.Post
  url: '/posts'
