
class PostsController < ApplicationController
  def index
    render App.posts.to_json, status: "200 OK"
    # pp = App.posts.map { |a| a.to_json[0..300] }
    # render pp.to_json, status: "200 OK"

  end

  def show
    if params[:action]
      comment = App.comments.select { |c| c.post_id ==
                                      params[:id].to_i }
      render comment.to_json, status: "200 OK"

    elsif params[:id]
      render App.posts[params[:id].to_i - 1].to_json, status: "200 OK"
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
