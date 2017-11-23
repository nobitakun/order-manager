class StaticPagesController < ApplicationController
  def home
    @orders = Order.all.page(params[:page])
  end
end
