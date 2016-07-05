
class CommentsController < ApplicationController
  def index
    render all_comments.to_json, status: "200 OK"
  end

  def show
    render all_comments[params[:id].to_i - 1].to_json, status: "200 OK"
  end

  def create
    comment = Comment.new(params["message"], params["author"], params["post_id"].to_i)
    App.comments.push(comment)
    redirect_to "comments/#{comment.id}"
  end

end
