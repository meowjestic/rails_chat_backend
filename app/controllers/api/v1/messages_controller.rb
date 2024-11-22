class Api::V1::MessagesController < ApplicationController
  # def index
  #   render json: Message.includes(:user).map { |msg| { key: msg.id.to_s + "." + msg.user.username, content: msg.content, username: msg.user.username } }
  # end

  # def create
  #   user = User.find_or_create_by(username: params[:username])
  #   message = user.messages.create(content: params[:content])
  #   puts "SQL Query: #{message.inspect}"

  #   if message.save
  #     puts Message.last.inspect
  #     ChatChannel.
  #     ActionCable.server.broadcast(
  #       "chat_channel",
  #       { username: user.username, content: "message.content" }
  #     )
  #   end

  #   render json: message, status: :created
  # end

  def show
    @message = Message.where("room_id = ? ", params[:id])

    render json: @message.includes(:user).map { |msg| { key: msg.id.to_s + "." + msg.user.username, content: msg.content, username: msg.user.username } }
  end
end
