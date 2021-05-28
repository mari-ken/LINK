class AddUserToGroupsController < ApplicationController
  def invite
    params[:userlist].each do | di1,di2 |
      if di2 == "1"
        AddUserToGroup.create(user_id: di1, room_id: params[:room_id])
      end
    end
  end

  def join
    current_user.user_rooms.create(room_id: params[:room_id])
    invite = AddUserToGroup.find(params[:invite_id])
    invite.destroy
    redirect_to room_path(params[:room_id])
  end

  def destroy
    invite = AddUserToGroup.find(params[:id])
    invite.destroy
    redirect_to user_path(current_user.id)
  end
end
