class PostsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessed

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  def create
    post = Post.create!(post_params)
    
    render json: post, status: :created
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def render_unprocessed(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end


end
