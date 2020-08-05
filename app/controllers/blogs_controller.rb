class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :show, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
    redirect_to blogs_path notice: "Blog Successfully Created!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
    redirect_to blogs_path notice: "Blog Updated!"
    else
      render :edit
    end
  end

  def destroy
  @blog.destroy
  redirect_to blogs_path, notice: "Blog Post Deleted!"
  end

  def confirm
  @blog=Blog.new(blog_params)
  render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
