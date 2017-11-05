class ItemCategoriesController < ApplicationController
  def index
    @item_categories = ItemCategory.all
  end

  def create
  end

  def destroy
  end
end
