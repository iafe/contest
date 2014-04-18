class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all
    @submissions = Submission.all
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
    @submission = Submission.find(params[:submission_id])
  end

  # GET /scores/new
  def new
    @score = Score.new
    @submission = Submission.find(params[:submission_id])
  end

  # GET /scores/1/edit
  def edit
    @submission = Submission.find(params[:submission_id])
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(score_params)
    @submission = Submission.find(params[:submission_id])

    respond_to do |format|
      if @score.save
        format.html { redirect_to submission_score_path(@submission, @score), notice: 'Score was successfully created.' }
        format.json { render action: 'show', status: :created, location: @score }
      else
        format.html { render action: 'new' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    @submission = Submission.find(params[:submission_id])
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to submission_score_path(@submission, @score), notice: 'Score was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:user_id, :submission_id, :total_score, :comments, :disqualify)
    end
end
