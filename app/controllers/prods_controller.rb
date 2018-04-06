class ProdsController < ApplicationController
  def index
    @products = policy_scope(Prod).order(created_at: :desc)
    # @products = Prod.all

    # @product = Product.find(params[:id])
    # @prices = @product.prices
    # @price = Price.new
  end

  def show
    @products = Prod.all
    @product = Prod.find(params[:id])
    authorize @product
    @prices = @product.prices
    @price = Price.new
  end

  def new
    @product = Prod.new
    @product.prices.build
    authorize @product
  end

  def create
    @product = Prod.new(product_params)
    @product.user_id = current_user.id
    authorize @product
    if @product.save
      redirect_to prods_path(@product)
    else
      render :edit
    end
  end

  def edit
    @product = Prod.find(params[:id])
    # @price = Price.find(params[:id])
    authorize @product
  end

  def update
    @product = Prod.find(params[:id])
    @price = @product.prices
    @product.user_id = current_user.id
    authorize @product
    if @product.update(product_params)
      redirect_to prod_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Prod.find(params[:id])
    @product.user_id = current_user.id
    authorize @product
    @product.destroy
    redirect_to prods_path
  end

private
    def product_params
      params.require(:prod).permit(:name, :size, :meta => {}, prices_attributes: [:id, :currency, :value, :prod_id])
    end
end
