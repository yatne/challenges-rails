class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ update destroy show ]

  def show

  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.avatar.attach(params[:avatar])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to root_path, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:avatar]
      @profile.avatar.attach(params[:avatar])
    end

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to edit_user_registration_path, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy!

    respond_to do |format|
      format.html { redirect_to new_user_session_path, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :user_id, :avatar)
    end
end
