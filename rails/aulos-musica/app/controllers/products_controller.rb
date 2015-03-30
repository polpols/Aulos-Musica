class ProductsController < ApplicationController
  def index
    @productHeaders=Product.attribute_names
    @products= Product.all
    respond_to do |format|
      format.html
      format.csv{ send_data @products.to_csv}
    end
  end
  def show
    @product=Product.find_by_id(params[:id])
  end
  
  def import
    Product.import(params[:file])
    redirect_to root_url, notice: "Product Imported"
    
  end
end
