class SmsSender
  ACCOUNT_SID  = ENV["TWILIO_ACCOUNT_SID"]
  AUTH_TOKEN   = ENV["TWILIO_AUTH_TOKEN"]
  TWILIO_PHONE = ENV["TWILIO_PHONE_NUMBER"]

  def self.run(number:, message:)
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

    client.messages.create(
      from: TWILIO_PHONE,
      to:   number,
      body: message
    )
  end
end
