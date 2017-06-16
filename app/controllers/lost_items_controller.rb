class LostItemsController < ApplicationController
  before_action :set_lost_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /lost_items
  # GET /lost_items.json
  def index
    @lost_items = LostItem.available_for(current_user)
  end

  # GET /lost_items/1
  # GET /lost_items/1.json
  def show
  end

  # GET /lost_items/new
  def new
    @lost_item = LostItem.new
  end

  # GET /lost_items/1/edit
  def edit
  end

  # POST /lost_items
  # POST /lost_items.json
  def create
    @lost_item = LostItem.new(lost_item_params)
    @lost_item.user = current_user

      if @lost_item.save
        redirect_to @lost_item, notice: 'Lost item was successfully created.' 
      else
        render :new 
      end
    
  end

  # PATCH/PUT /lost_items/1
  # PATCH/PUT /lost_items/1.json
  def update
    respond_to do |format|
      if @lost_item.update(lost_item_params)
        format.html { redirect_to @lost_item, notice: 'Lost item was successfully updated.' }
        format.json { render :show, status: :ok, location: @lost_item }
      else
        format.html { render :edit }
        format.json { render json: @lost_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lost_items/1
  # DELETE /lost_items/1.json
  def destroy
    @lost_item.destroy
    respond_to do |format|
      format.html { redirect_to lost_items_url, notice: 'Lost item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lost_item
      @lost_item = LostItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lost_item_params
      params.require(:lost_item).permit(:title, :description, :location, :found_date)
    end
end
