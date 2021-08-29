# frozen_string_literal: true

class TwilioClient # rubocop:todo Style/Documentation
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(user, message)
    client.api.account.messages.create(
      to: user,
      from: '+12142391675',
      body: message,
    )
  end

  def account_sid
    "AC84ce9db1363ea8dda6302b04c5d126d1"
  end

  def auth_token
    "17d46324c2083eee058db0b9a5fee106"
  end

end