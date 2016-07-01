
# each comment has a user id. This is so can link the comment's user id with the post's user id.

require_relative '../models/post'

class Comment
  attr_accessor :id, :message, :author, :post_id
  def initialize(message, author)
    @id = set_id
    @message = message
    @author = author
    @post_id = rand(1..2)
  end


  def set_id
    $__comment_id ||= 0
    $__comment_id += 1
  end

  def to_json(json_arg = nil)
     {
       id: @id,
       message: @message,
       author: @author,
       post_id: @post_id
     }.to_json
  end

end

# Each post has its own post ID, each comment has its own comment ID, each comment has its own post ID. Then, make comment's post_id == Post's id. This way you can pull a comment with post_id = 1 and put it with a post with id = 1.


# WHERE IM AT: I got comments to display with posts. Now I'm trying to get 4 comments to produce and be assigned randomly to the posts. Problem so far: sometimes 4 comments, sometimes less, sometimes more get produced and assigned to posts by the ID. WHY is it doing more or less sometimes?
