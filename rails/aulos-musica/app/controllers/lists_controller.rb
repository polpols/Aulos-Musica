class ListsController < ApplicationController
  before_action :set_list, only: [:show,:edit,:update,:destroy]

  def index
    @lists = List.includes(:products)
    respond_to do |format|
      format.html
      format.json {send_data @list.to_json}
    end
  end

  def show
  end

  def edit
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice:"List was created"}
        format.json { render :show, status: :created, location: @list}
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end
  def remove_product_id
    @list=List.find(params[:list_id])
    @list.remove_product_id(params[:product_id])
    respond_to do |format|
      format.html { redirect_to @list }
      format.json
    end
  end
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html{ redirect_to @list, notice: "List successefully updated"}
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
  def set_list
      @list = List.find(params[:id])
    end

  def list_params
      params.require(:list).permit(:name, :description, :product_count, :product_token)
    end
end
