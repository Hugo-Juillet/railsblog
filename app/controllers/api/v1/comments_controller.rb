# class Api::V1::CommentsController < ApplicationController
# end


module Api::V1
  class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def index
      comments = Comment.all
      render json: comments
    end

    def show
      comment = Comment.find(params[:id])
      render json: comment
    end

    def create
      comment = current_user.comments.new(comment_params)
      if comment.save
        render json: comment, status: :created
      else
        render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
  end
end

