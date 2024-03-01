class ShoppingListsController < ApplicationController
  def index
    # Obtener la fecha más reciente de los grupos de productos
    @latest_date = Product.order(purchase_date: :desc).limit(1).pluck(:purchase_date).first

    # Obtener los productos asociados a esa fecha
    @latest_products = Product.where(purchase_date: @latest_date)

    # Obtener otros grupos de productos
    @other_product_groups = Product.where.not(purchase_date: @latest_date).group_by(&:purchase_date)
  end
end
