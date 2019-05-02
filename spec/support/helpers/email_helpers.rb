require 'mailcatcher/api' # gem install mailcatcher-api

module Helpers
  def verify_email_receipt(opts={})
    defaults = {
      to: "",
      bcc: "",
      from: "",
      subject: "",
      body: "",
      place: 1 #in mailcatcher-api, the last email is place 1 and is at the top of the gui list.
    }

    options = defaults.merge(opts)

    mailbox = MailCatcher::API::Mailbox.new

    slept = 0
    while mailbox.messages.count == 0 and slept < (Integer(ENV['DELAYED_JOB_PERIOD'] || 5) + 2)
      sleep 1
      slept = slept + 1
      mailbox = MailCatcher::API::Mailbox.new
    end
    fail 'No emails sent.' if mailbox.messages.count == 0

    email = mailbox.messages.first(options[:place])[-1]

    body = email.decode_body

    expect(email.subject).to eq options[:subject]

    expect(options[:to].split(",").flatten).to eq email.to

    body = body.gsub("\r\n", "").squish
    expect(body).to include options[:body]

    return email
  end

  def clear_mailbox
    (MailCatcher::API::Mailbox.new).clear!
  end

  def verify_no_email
    mailbox = MailCatcher::API::Mailbox.new

    sleep (Integer(ENV['DELAYED_JOB_PERIOD'] || 5) + 5)

    expect(mailbox.messages.count).to eq 0
  end
end
