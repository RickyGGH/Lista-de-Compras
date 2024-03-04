class ShoppingListsController < ApplicationController
  def index
    # Obtener la fecha más reciente de los grupos de productos
    @earliest_date = Product.order(:purchase_date).limit(1).pluck(:purchase_date).first

    # Obtener los productos asociados a esa fecha
    @earliest_products = Product.where(purchase_date: @earliest_date, purchased: false)

    # Obtener otros grupos de productos
    @other_product_groups = Product.where.not(purchase_date: @earliest_date).where(purchased: false).group_by(&:purchase_date)

    # Crear una instancia de producto para el formulario
    @product = Product.new
  end

  def create
    # Verificar si se proporciona la fecha de compra, si no, establecerla en la fecha actual
    if product_params[:purchase_date].blank?
      product_params[:purchase_date] = Date.today
    end

    @product = Product.new(product_params)
    if @product.valid? && @product.save
      # Redirigir a la raíz de la página para refrescar y mostrar el nuevo producto
      redirect_to root_path, notice: 'Product added successfully!'
    else
      # Si hay errores de validación, renderizar de nuevo la página principal con los errores
      flash.now[:alert] = 'Invalid attributes. Please correct the errors.'
      render :index
    end
  end


  def update
    @product = Product.find(params[:id])
    if @product.update(purchased: true)
      puts "Product marked as purchased and updated successfully"
      head :no_content # Devolver una respuesta exitosa

      # Eliminar el producto de la base de datos después de actualizar el atributo 'purchased'
      @product.destroy
    else
      puts "Error updating product: #{@product.errors}"
      head :bad_request # Devolver una respuesta de error
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :quantity)
  end
end
