class RegistrationsController < Devise::RegistrationsController
  before_action :set_profile, only: %i[ edit update ]

  protected

  def after_sign_up_path_for(resource)
    new_profile_path # Or :prefix_to_your_route
  end

  private

  def set_profile
    unless @user.profile
      @profile = Profile.new
    end
  end
end
