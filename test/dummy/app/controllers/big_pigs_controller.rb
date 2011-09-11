class BigPigsController < ApplicationController
  respond_to :html

  def index
    @bigpigs = BigPig.all
    respond_with(@bigpigs)
  end

  def new
    @bigpig = BigPig.new
    respond_with(@bigpig)
  end
  
  def create
    @bigpig = BigPig.create(params[:big_pig])
    respond_with(@bigpig)
  end
  
  def show
    @bigpig = BigPig.find(params[:id])
    respond_with(@bigpig)
  end
  
  def edit
    @bigpig = BigPig.find(params[:id])
    respond_with(@bigpig)
  end
    
  def update
    @bigpig = BigPig.find(params[:id])
    @bigpig.update_attributes(params[:big_pig])
    respond_with(@bigpig)
  end
end