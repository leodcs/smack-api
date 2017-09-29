class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    message_as_json = ActiveModelSerializers::SerializableResource.new(message).as_json.merge(action: 'CreateMessage')
    ChatChannel.broadcast_to(message.chat, message_as_json)
  end
end