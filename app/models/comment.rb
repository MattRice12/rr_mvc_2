
# each comment has a user id. This is so can link the comment's user id with the post's user id.


class Comment
  attr_accessor :id, :message, :author, :post_id
  def initialize(id, message, author, post_id)
    @id = set_id
    @message = message
    @author = author
    @post_id = post_id
  end

  def Comment.all
    [
      Comment.new(@id, "First", "Dickface", Post.new.id), #gets.chomp?
    ]
  end

  def set_id
    $__comment_id ||= 0
    $__comment_id =+ 1
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
