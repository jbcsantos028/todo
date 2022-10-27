class CategoriesController < ApplicationController
  before_action :require_user
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:notice] = "Category was created successfully."
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def index
    @categories = current_user.categories
  end

  def show
    @tasks = @category.tasks
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category title was updated successfully."
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to categories_path, notice: "No such category associated to the current user."
  end

  def category_params
    params.require(:category).permit(:title)
  end

end
