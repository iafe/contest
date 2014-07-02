class OrganizationDetailsController < ApplicationController
  before_action :set_organization_detail, only: [:show, :edit, :update, :destroy]
  
  load_and_authorize_resource

  # GET /organization_details
  # GET /organization_details.json
  def index
    @organization_details = OrganizationDetail.all
  end

  # GET /organization_details/1
  # GET /organization_details/1.json
  def show
  end

  # GET /organization_details/new
  def new
    @organization_detail = OrganizationDetail.new
	  @user = User.find(current_user)
	  @award_deadline = Deadline.order("created_at").last
  end

  # GET /organization_details/1/edit
  def edit
    @award_deadline = Deadline.order("created_at").last
  end

  # POST /organization_details
  # POST /organization_details.json
  def create
    @organization_detail = OrganizationDetail.new(organization_detail_params)

    respond_to do |format|
      if @organization_detail.save
        format.html { redirect_to @organization_detail, notice: 'Organization detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @organization_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @organization_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_details/1
  # PATCH/PUT /organization_details/1.json
  def update
    respond_to do |format|
      if @organization_detail.update(organization_detail_params)
        format.html { redirect_to @organization_detail, notice: 'Organization detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organization_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_details/1
  # DELETE /organization_details/1.json
  def destroy
    @organization_detail.destroy
    respond_to do |format|
      format.html { redirect_to organization_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_detail
      @organization_detail = OrganizationDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_detail_params
      params.require(:organization_detail).permit(:organization_id, :fair_start_date, :fair_end_date, :total_attendance)
    end
end
