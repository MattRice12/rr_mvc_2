
class PostsController < ApplicationController
  def index
    if params.keys[0] == "page"
      if (page * 10) - 9 <= all_posts.count
        render all_posts[ten_per_page].to_json, status: "200 OK"
      end
    else
      render all_posts[0..9].to_json, status: "200 OK"
    end
  end

  def show
    if action
      if action == "comments"
        comment_array = all_comments.select { |c| c.post_id == id.to_i }
        render comment_array.to_json, status: "200 OK"
      else
        redirect_to "../../posts/#{id}"
      end
    else
      case id
      when "published"
        post_array = all_posts.select { |pub| pub.published_field == "Published" }
        render post_array.to_json
      when "unpublished"
        post_array = all_posts.select { |unpub| unpub.published_field == false }
        render post_array.to_json
      else
        render all_posts[id.to_i - 1].to_json, status: "200 OK"
      end
    end
  end

  def create
    post = Post.new(params["title"], params["author"], params["body"],
                    params["published_field"])
    App.posts.push(post)
    redirect_to "posts/#{post.id}"
  end
end
