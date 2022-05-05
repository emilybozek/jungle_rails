class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "jungle", password: "book"

  def show
    @product_amount = Product.count
    @category_amount = Category.count
  end
end
