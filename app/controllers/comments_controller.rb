
class CommentsController < ApplicationController
  def index
    render App.comments.to_json, status: "200 OK"
  end

  def show
    render App.comments[params[:id].to_i - 1].to_json, status: "200 OK"
  end

  def create
    comment = Comment.new(params["message"], params["author"])
    App.comments.push(comment)
    redirect_to "comment/#{comment.id}"
  end

end
