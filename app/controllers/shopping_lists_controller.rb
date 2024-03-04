class ShoppingListsController < ApplicationController
  def index
    @earliest_date = Product.order(:purchase_date).limit(1).pluck(:purchase_date).first

    @earliest_products = Product.where(purchase_date: @earliest_date, purchased: false)

    @other_product_groups = Product.where.not(purchase_date: @earliest_date).where(purchased: false).group_by(&:purchase_date)

    @product = Product.new
  end

  def create
    if product_params[:purchase_date].blank?
      product_params[:purchase_date] = Date.today
    end

    @product = Product.new(product_params)
    if @product.valid? && @product.save
      redirect_to root_path, notice: 'Product added successfully!'
    else
      flash.now[:alert] = 'Invalid attributes. Please correct the errors.'
      render :index
    end
  end


  def update
    @product = Product.find(params[:id])
    if @product.update(purchased: true)
      puts "Product marked as purchased and updated successfully"
      head :no_content

      @product.destroy
    else
      puts "Error updating product: #{@product.errors}"
      head :bad_request
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :purchase_date, :store_name, :store_section_id, :quantity)
  end
end
