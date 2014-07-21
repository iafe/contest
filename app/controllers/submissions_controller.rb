class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  
  load_and_authorize_resource through: :current_user

  # GET /submissions
  # GET /submissions.json
  def index
    @award_deadline = Deadline.order("created_at").last
    @paginate = current_user.submissions.find(:all, select: 'DISTINCT(submissions.id), organization_id, contest_year', group: [:organization_id, :contest_year], include: :organization, order: ['contest_year DESC'])
  end
  
  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
    @award_deadline = Deadline.order("created_at").last
  end

  # GET /submissions/1/edit
  def edit
    @award_deadline = Deadline.order("created_at").last
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)
    @submission.division_id = @submission.organization.submission_division
    @submission.contest_year = Time.now.year
    @award_deadline = Deadline.order("created_at").last
    
    respond_to do |format|
      if @submission.save
        if @submission.category.required_format == "Physical Only"
          format.html { redirect_to submissions_path, notice: 'Submission was successfully created.' }
        else
          format.html { redirect_to new_submission_submission_detail_path(@submission), notice: 'Submission was successfully created.' }
          format.json { render action: 'show', status: :created, location: @submission }
        end
        # notifies IAFE staff of a new contest submission prior to the start of September
        if Time.now.month < 9
          SubmissionAdd.added(@submission).deliver
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    @award_deadline = Deadline.order("created_at").last
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }

      else
        format.html { render action: 'edit' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:category_id, :user_id, :organization_id, :division_id,
      :contest_year, :notes, :status, :physical_version_received, :digital_version_received, :disqualify,
      :disqualify_reason, :best_of_division, :judges_choice)
    end
end
