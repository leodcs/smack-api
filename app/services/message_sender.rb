class MessageSender
  def initialize(message, current_user)
    @message = message
    @sender = current_user
  end

  def perform
    begin
      @message.sender = @sender
      @message.save
    rescue
      false
    end
  end
end