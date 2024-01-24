class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @challenge = Challenge.where(invite_token: params['token'])[0];
  end

  def accept
    challenge = Challenge.where(invite_token: params['token'])[0];
    challenge.participants.push(current_user)
    challenge.save
    redirect_to(challenges_path)
  end
end
