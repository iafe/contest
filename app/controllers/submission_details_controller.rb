class SubmissionDetailsController < ApplicationController
  before_action :set_submission_detail, only: [:show, :edit, :update, :destroy]
  
  load_and_authorize_resource

  # GET /submission_details
  # GET /submission_details.json
  def index
    @submission_details = SubmissionDetail.all
  end

  # GET /submission_details/1
  # GET /submission_details/1.json
  def show
    @submission = Submission.find(params[:submission_id])
  end

  # GET /submission_details/new
  def new
    @submission_detail = SubmissionDetail.new
    @submission = Submission.find(params[:submission_id])
  end

  # GET /submission_details/1/edit
  def edit
    @submission = Submission.find(params[:submission_id])
  end

  # POST /submission_details
  # POST /submission_details.json
  def create
    @submission = Submission.find(params[:submission_id])
    @submission_detail = SubmissionDetail.new(submission_detail_params)

    respond_to do |format|
      if @submission_detail.save
        format.html { redirect_to submission_submission_detail_path(@submission, @submission_detail), notice: 'Submission detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @submission_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @submission_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submission_details/1
  # PATCH/PUT /submission_details/1.json
  def update
    @submission = Submission.find(params[:submission_id])
    respond_to do |format|
      if @submission_detail.update(submission_detail_params)
        format.html { redirect_to submission_submission_detail_path(@submission, @submission_detail), notice: 'Submission detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @submission_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submission_details/1
  # DELETE /submission_details/1.json
  def destroy
    @submission_detail.attachment = nil
    @submission_detail.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission_detail
      @submission_detail = SubmissionDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_detail_params
      params.require(:submission_detail).permit(:submission_id, :file_url, :attachment)
    end
end
