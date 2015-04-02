class ListsController < ApplicationController

  def index
    @lists=List.all
  end

  def show
    @list=List.find(params[:id])
  end

  def new
    @list=List.new

  end

  def create
    @list=List.new
    respond_to do |format|
      if @animal.save
        format.html{redirect_to @list,notice:"List ws created"}
        format.json{}
      else

      end

    end
  end

  def destroy
  end
end
