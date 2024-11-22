class ChatChannel < ApplicationCable::Channel
  def subscribed
    if params[:room].present?
      # creates a private chat room with a unique name
      stream_from("ChatRoom-#{(params[:room])}")
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # Process incoming data here
    user = User.find_or_create_by(username: data["username"])
    message = user.messages.create(content: data["content"], room_id: data["room"])
    puts "SQL Query: #{message.inspect}"

    if message.save
      ActionCable.server.broadcast(
        "ChatRoom-#{(data["room"])}",
        { id: message, username: user.username, content: message.content }
      )
    end
    # ActionCable.server.broadcast("chat_channel", data)
  end
end
