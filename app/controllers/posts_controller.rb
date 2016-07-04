
class PostsController < ApplicationController
  def index
    if params.keys[0] == "page"
      render App.posts[((page - 1) * 10)..((page * 10) - 1)].to_json, status: "200 OK"
    else
      render App.posts.to_json, status: "200 OK"
    end


  
    # pp = App.posts.map { |a| a.to_json[0..300] }
    # render pp.to_json, status: "200 OK"

    # For some reason, the parser is storing "page" as a string rather than a symbol. I compared this with Wednesday's assignment, which stored "page" as a symbol. The parser says it stores "page" as a symbol => params.store(k.to_sym, v)... however, it's not doing this at all. Substituting in Wednesday's parser does not change the result. I really can't figure out why it's storing "page" as a string rather than a symbol... so this is why my index looks the way it does.
    # render params.values[0].to_json, status: "200 OK"

# http://localhost:3001/posts?page=1
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
