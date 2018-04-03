class ProdsController < ApplicationController
  def index
    # @products = policy_scope(Product).order(created_at: :desc)
    @products = Prod.all
    # @product = Product.find(params[:id])
    # @prices = @product.prices
    # @price = Price.new
  end

  def show
    @products = Prod.all
    @product = Prod.find(params[:id])
    @prices = @product.prices
    @price = Price.new
  end

  def new
    @product = Prod.new
    @product.prices.build
  end

  def create
    @product = Prod.new(product_params)
    @product.user_id = current_user.id
    @product.save!
    redirect_to prods_path(@product)
  end

  def edit
    @product = Prod.find(params[:id])
  end

private
    def product_params
      params.require(:prod).permit(:name, :size, prices_attributes: [:currency, :value])
    end
end
