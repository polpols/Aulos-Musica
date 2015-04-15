class ListsController < ApplicationController
  before_action :set_list, only: [:show,:edit,:update,:destroy]
  def index
    @lists = List.all
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
        format.html{redirect_to @list,notice:"List was created"}
        format.json{}
      else
      end
    end
  end

  def update

  end

  def destroy
  end

  private
  def set_list
      @list = List.find(params[:id])
    end

  def list_params
      params.require(:list).permit(:name, :description)
    end
end
