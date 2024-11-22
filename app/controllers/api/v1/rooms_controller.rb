class Api::V1::RoomsController < ApplicationController
  def index
    render json: Room.includes(:user).map { |room| { id: room.id, key: room.id.to_s + "." + room.user.username, desc: room.desc, name: room.name, owner: room.user.username } }
  end

  def create
    @user = User.find_or_create_by(username: params["username"])
    @room = Room.create(user_id: @user.id, name: params["name"], desc: params["desc"])

    if @room.save
      render json: { key: @room.id.to_s + "." + @room.user.username, desc: @room.desc, name: @room.name, owner: @room.user.username, id: @room.id }
    else
      render json: { error: "Room creation failed" }, status: :unprocessable_entity
    end
  end
end
