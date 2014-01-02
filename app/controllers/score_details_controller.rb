class ScoreDetailsController < ApplicationController
  before_action :set_score_detail, only: [:show, :edit, :update, :destroy]

  # GET /score_details
  # GET /score_details.json
  def index
    @score_details = ScoreDetail.all
  end

  # GET /score_details/1
  # GET /score_details/1.json
  def show
  end

  # GET /score_details/new
  def new
    @score_detail = ScoreDetail.new
  end

  # GET /score_details/1/edit
  def edit
  end

  # POST /score_details
  # POST /score_details.json
  def create
    @score_detail = ScoreDetail.new(score_detail_params)

    respond_to do |format|
      if @score_detail.save
        format.html { redirect_to @score_detail, notice: 'Score detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @score_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @score_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /score_details/1
  # PATCH/PUT /score_details/1.json
  def update
    respond_to do |format|
      if @score_detail.update(score_detail_params)
        format.html { redirect_to @score_detail, notice: 'Score detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @score_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /score_details/1
  # DELETE /score_details/1.json
  def destroy
    @score_detail.destroy
    respond_to do |format|
      format.html { redirect_to score_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score_detail
      @score_detail = ScoreDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_detail_params
      params.require(:score_detail).permit(:score_id, :points, :score_item_id)
    end
end
