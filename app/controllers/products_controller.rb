class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description,:image)
  end
end