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
    # @price = Price.find(params[:price_id])
    @product = Prod.find(params[:prod_id])
    authorize @price
  end

  def update
    @product = Prod.find(params[:prod_id])
    @price = Price.find(params[:id])
    authorize @price
    if @price.update(price_params)
      redirect_to prod_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @price = Price.find(params[:id])
    @product = Prod.find(@price.prod_id)
    authorize @price
    @price.destroy
    redirect_to prod_path(@product)
  end



private
  def price_params
    params.require(:price).permit(:currency, :value, :prod_id, prods_attributes: [:name, :size, :id])
  end

end
