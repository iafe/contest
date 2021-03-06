class UserOrganizationsController < ApplicationController
  before_action :set_user_organization, only: [:show, :edit, :update, :destroy]
  
  load_and_authorize_resource # Checks to see what tasks the user can perform

  # GET /user_organizations
  # GET /user_organizations.json
  def index
    @user_organizations = UserOrganization.all
  end

  # GET /user_organizations/1
  # GET /user_organizations/1.json
  def show
  end

  # GET /user_organizations/new
  def new
    @user_organization = UserOrganization.new
	  @user = User.find(current_user)
  end

  # GET /user_organizations/1/edit
  def edit
  end

  # POST /user_organizations
  # POST /user_organizations.json
  def create
    @user_organization = UserOrganization.new(user_organization_params)
	
    respond_to do |format|
      if @user_organization.save
        format.html { redirect_to @user_organization, notice: 'User organization was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_organization }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_organizations/1
  # PATCH/PUT /user_organizations/1.json
  def update
    respond_to do |format|
      if @user_organization.update(user_organization_params)
        format.html { redirect_to @user_organization, notice: 'User organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_organizations/1
  # DELETE /user_organizations/1.json
  def destroy
    @user_organization.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_organization
      @user_organization = UserOrganization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_organization_params
      params.require(:user_organization).permit(:user_id, :organization_id, :primary)
    end
end
