class PricesController < ApplicationController
  def new
    @price = Price.new
    @product = Prod.new
    authorize @price
    @product.prices.build
  end

  def create
    @product = Prod.find(params[:prod_id])
    @price = Price.new(price_params)
    authorize @price
    @price.prod = @product
    if @price.save
      redirect_to prod_path(@price.prod)
    else
      render :edit
    end
  end

  def edit
    @price = Price.find(params[:id])
  end



private
  def price_params
    params.require(:price).permit(:currency, :value, :product_id)
  end

end
