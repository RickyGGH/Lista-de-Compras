class ProductGroupComponent < ViewComponent::Base
  def initialize(date:, products:)
    @date = date
    @products = products
  end
end
