class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show  ]
  before_action :set_product, only: [ :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @products = Product.includes(:category).all
  end

  def show
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.warn "Product not found: #{e.message}"
    redirect_to root_path
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      flash.now[:alert] = "There were some errors with your submission."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @product ya se define en set_product
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def my_products
    @products = current_user.products
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to products_path, alert: "Product not found" 
  end

  def authorize_user!
    if @product.user != current_user
      redirect_to products_path, alert: "Not authorized to modify this product"
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id)
  end
end
