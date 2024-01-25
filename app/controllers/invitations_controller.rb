class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @challenge = Challenge.where(invite_token: params['token'])[0];
    @is_creator = is_creator
    @is_participant = is_participant
  end

  def is_creator
    @challenge.creator == current_user
  end

  def is_participant
    @challenge.participants.include?(current_user)
  end

  def accept
    challenge = Challenge.where(invite_token: params['token'])[0];
    challenge.participants.push(current_user)
    challenge.save
    redirect_to(challenges_path)
  end
end
