class BoysController < ApplicationController
  before_action :set_boy, only: [:show, :edit, :update, :destroy]

  # GET /boys
  # GET /boys.json
  def index
    @boys = Boy.all
  end

  # GET /boys/1
  # GET /boys/1.json
  def show
  end

  # GET /boys/new
  def new
    @boy = Boy.new
  end

  # GET /boys/1/edit
  def edit
  end

  # POST /boys
  # POST /boys.json
  def create
    @boy = Boy.new(boy_params)

    respond_to do |format|
      if @boy.save
        format.html { redirect_to @boy, notice: 'Boy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @boy }
      else
        format.html { render action: 'new' }
        format.json { render json: @boy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boys/1
  # PATCH/PUT /boys/1.json
  def update
    respond_to do |format|
      if @boy.update(boy_params)
        format.html { redirect_to @boy, notice: 'Boy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @boy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boys/1
  # DELETE /boys/1.json
  def destroy
    @boy.destroy
    respond_to do |format|
      format.html { redirect_to boys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boy
      @boy = Boy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boy_params
      params.require(:boy).permit(:name, :user_id, :age, :height, :weight, :class)
    end
end
