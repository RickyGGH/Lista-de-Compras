class ShoppingListsController < ApplicationController
  def index
    # Obtener la fecha más reciente de los grupos de productos
    @earliest_date = Product.order(:purchase_date).limit(1).pluck(:purchase_date).first

    # Obtener los productos asociados a esa fecha
    @earliest_products = Product.where(purchase_date: @earliest_date)

    # Obtener otros grupos de productos
    @other_product_groups = Product.where.not(purchase_date: @earliest_date).group_by(&:purchase_date)
  end
end
