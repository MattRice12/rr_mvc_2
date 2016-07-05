
class PostsController < ApplicationController
  def index
    if params.keys[0] == "page"
      if page * 10 <= all_posts.count
        render all_posts[ten_per_page].to_json, status: "200 OK"
      end
    else
      render all_posts[0..9].to_json, status: "200 OK"
    end
  end

  def show
    if action == "comments"
      comment_array = all_comments.select { |c| c.post_id == id.to_i }
      render comment_array.to_json, status: "200 OK"

    elsif id
      unless action
        render all_posts[id.to_i - 1].to_json, status: "200 OK"
      end
    end
  end

  def create
    post = Post.new(params["title"], params["author"], params["body"],
                    params["published_field"])
    App.posts.push(post)
    redirect_to "post/#{post.id}"
  end
end

# Add a new route /posts/1/comments that displays only the comments for that post.
