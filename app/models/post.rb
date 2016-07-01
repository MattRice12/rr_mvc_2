# The post_id field will be the id of the Post that this comment "belongs to".
# This will be used for "linking" the two pieces of data together.


class Post
  attr_accessor :id, :author, :title, :body, :published_field
  def initialize(title, author, body, published_field)
    @id = set_id
    @title = title
    @author = author
    @body = body
    @published_field = published_field
  end

  def set_id
    $__post_id ||= 0
    $__post_id += 1
  end

  def comments
    App.comments.select { |c| c.post_id == id }
  end

  def to_json(json_arg = nil)
     {
       id: @id,
       title: @title,
       author: @author,
       body: @body,
       published_field: @published_field,
       comments: comments
     }.to_json
  end
end
