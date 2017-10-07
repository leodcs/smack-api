class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    message_as_json = ActiveModelSerializers::SerializableResource.new(message).as_json
    ChatChannel.broadcast_to(message.chat, message_as_json.merge(action: 'CreateMessage'))
    message.chat.users.each do |user|
      InboxChannel.broadcast_to(user, action: 'UpdateChat')
    end
  end
end