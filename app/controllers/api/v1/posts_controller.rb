# class Api::V1::PostsController < ApplicationController
# end

module Api::V1
  class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def index
      posts = Post.all
      render json: posts.as_json(include: { comments: { only: [:id, :body] }, user: { only: [:id, :email] } })
    end

    def show
      post = Post.find(params[:id])
      render json: post.as_json(include: :comments)
    end

    def create
      post = current_user.posts.new(post_params)
      if post.save
        render json: post, status: :created
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
end

