# Create a Post class that has an id, title, author, body, and published field.

class Post
  attr_accessor :id, :title, :author, :body, :published_field
  def initialize(id, title, author, body, published_field)
    @id = id
    @title = title
    @author = author
    @body = body
    @published_field = published_field
  end

  def set_id
    $__post_id ||= 0
    $__post_id =+ 1
  end

  def to_json(json_arg = nil)
     {
       id: @id,
       title: @title,
       author: @author,
       body: @body,
       published_field: @published_field
     }.to_json
  end
end
