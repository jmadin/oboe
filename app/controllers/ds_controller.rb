class DsController < ApplicationController
  before_action :set_d, only: [:show, :edit, :update, :destroy]

  # GET /ds
  # GET /ds.json
  def index
    @ds = D.all
  end

  # GET /ds/1
  # GET /ds/1.json
  def show
  end

  # GET /ds/new
  def new
    @d = D.new
  end

  # GET /ds/1/edit
  def edit
  end

  # POST /ds
  # POST /ds.json
  def create
    @d = D.new(d_params)

    respond_to do |format|
      if @d.save
        format.html { redirect_to @d, notice: 'D was successfully created.' }
        format.json { render action: 'show', status: :created, location: @d }
      else
        format.html { render action: 'new' }
        format.json { render json: @d.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ds/1
  # PATCH/PUT /ds/1.json
  def update
    respond_to do |format|
      if @d.update(d_params)
        format.html { redirect_to @d, notice: 'D was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @d.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ds/1
  # DELETE /ds/1.json
  def destroy
    @d.destroy
    respond_to do |format|
      format.html { redirect_to ds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_d
      @d = D.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def d_params
      params.require(:d).permit(:measurement_id, :value)
    end
end
