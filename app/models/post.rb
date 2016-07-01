# The post_id field will be the id of the Post that this comment "belongs to".
# This will be used for "linking" the two pieces of data together.

class Post
  attr_accessor :id, :title, :author, :body, :published_field
  def initialize(id, title, author, body, published_field)
    @id = set_id
    @title = title
    @author = author
    @body = body
    @published_field = published_field
  end

  def Post.all
    [
      Post.new(@id, "5 ways to REALLY tale if your in LOVE for REAL", "cr4zy_gurl_14", "1) You hold hands, 2) When you say 'i luv u,' you put a winky face after it and MEAN it, 3) if ur boi dont buy u flowers today you acuse him of cheeting, 5) when you read this you think of him <3.", false), #gets.chomp?
    ]
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
