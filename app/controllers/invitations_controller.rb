class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end

  def create
    current_user.send_invitation(params[:user])
    redirect_to users_path
  end

  def update
    @invitation = Invitation.find_invitation(current_user.id, friend_id)
    response = params[:response]
    if response == 'accepted'
      @invitation.confirmed = true
    else
      @invitation.destroy
    end
  end

  def delete
  end
end
