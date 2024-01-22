class InvitationsController < ApplicationController
  def show
    @challenge = Challenge.where(invite_token: params['token'])[0];
  end

  def accept_invitation
    puts 'accept'
  end
end
