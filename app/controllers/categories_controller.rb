class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @snaps = Snap.where(category_id: @category.id)
  end
end
