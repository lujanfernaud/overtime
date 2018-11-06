require 'rails_helper'

RSpec.describe SmsSender do
  it "sends message to valid phone with country code" do
    phone   = "+34600100200"
    message = "This is a test."

    result = SmsSender.run(number: phone, message: message)

    expect { result }.not_to raise_error(/not a valid phone number/)
    expect(result.body).to match(message)
  end

  it "doesn't send message to valid phone without country code" do
    phone = "600100200"

    expect { SmsSender.run(number: phone, message: "This is a test.") }
      .to raise_error(/not a valid phone number/)
  end
end
