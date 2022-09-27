class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @my_friends = current_user.friends
  end

  def index
    @invitations = Invitation.all
    @my_invitations = Invitation.where(friend_id: current_user.id, confirmed: false)
  end

  def create
    current_user.send_invitation(params[:user])
    redirect_to users_path
  end

  def update
    @invitation = Invitation.find(params[:id])
    response = params[:response]
    if response == 'accepted'
      @invitation.confirmed = true
      @invitation.save
      redirect_to invitations_path
    else
      @invitation.destroy
      redirect_to invitations_path
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to invitation_path(current_user.id)
  end
end
