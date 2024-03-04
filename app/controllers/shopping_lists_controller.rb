class ShoppingListsController < ApplicationController
  def index
    # Obtener la fecha más reciente de los grupos de productos
    @earliest_date = Product.order(:purchase_date).limit(1).pluck(:purchase_date).first

    # Obtener los productos asociados a esa fecha
    @earliest_products = Product.where(purchase_date: @earliest_date)

    # Obtener otros grupos de productos
    @other_product_groups = Product.where.not(purchase_date: @earliest_date).group_by(&:purchase_date)

    # Crear una instancia de producto para el formulario
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # Redirigir a la raíz de la página para refrescar y mostrar el nuevo producto
      redirect_to root_path, notice: 'Product added successfully!'
    else
      # Si hay errores de validación, renderizar de nuevo la página principal con los errores
      flash.now[:alert] = 'Invalid attributes. Please correct the errors.'
      render :index
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :purchased, :quantity)
  end
end
