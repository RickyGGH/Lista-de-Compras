class ProductGroupComponent < ViewComponent::Base
  def initialize(date, products)
    @date = date
    @products = products
  end

  def render
    render(:product_group)
  end
end
