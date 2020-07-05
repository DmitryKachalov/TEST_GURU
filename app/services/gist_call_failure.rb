class GistCallFailure
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def success?
    false
  end
end