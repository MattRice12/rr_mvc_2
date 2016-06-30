# Create a Comment class. Comments should have an id, message, author, and post_id field.
# The post_id field will be the id of the Post that this comment "belongs to".
# This will be used for "linking" the two pieces of data together.

class Comment
  attr_accessor :id, :message, :author, :post_id
  def initialize(id, message, author, post_id)
    @id = id
    @message = message
    @author = author
    @post_id = post_id
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
