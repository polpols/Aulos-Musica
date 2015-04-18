class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:edit,:update,:destroy]

  def index
    @productHeaders=Product.attribute_names
    @products= Product.all
    respond_to do |format|
      format.html
      format.json {send_data @products.to_json}
      format.csv {send_data @products.to_csv}
    end
  end

  def show
  end

  def destroy
  end

  def create
    product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice:"Product was created"}
        format.json { render :show, status: :created, location: @product}
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html{ redirect_to @product, notice: "Product successefully updated"}
        format.json { render :json => @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    Product.import(params[:file])
    redirect_to product_url, notice: "Product Imported"
  end

  private

  def set_product
      @product = Product.find(params[:id])
    end

  def product_params
      params.require(:product).permit(:title,:subtitle,:author,:composer,:description,:info,:instrument,:isbn,:manufacturer,:type)
    end
end
