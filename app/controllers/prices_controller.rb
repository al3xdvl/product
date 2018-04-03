class PricesController < ApplicationController
  def new
    @price = Price.new
    @product = Prod.new
    @product.prices.build
  end

  def create
    @product = Prod.find(params[:prod_id])
    @price = Price.new(price_params)
    @price.prod = @product
    @price.save
    redirect_to prod_path(@price.prod)
  end



private
  def price_params
    params.require(:price).permit(:currency, :value, :product_id)
  end

end
