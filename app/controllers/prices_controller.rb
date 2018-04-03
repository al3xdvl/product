class PricesController < ApplicationController
  def new
    @price = Price.new
    @product = Prod.new
    @product.prices.build
  end

  def create
    @product = Prod.find(params[:product_id])
    @price = Price.new(price_params)
    authorize @price
    @price.product = @product
    @price.save
    redirect_to product_path(@price.product)
  end



private
  def price_params
    params.require(:price).permit(:currency, :value, :product_id)
  end

end
